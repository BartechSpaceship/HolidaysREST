//
//  HolidayRequest.swift
//  HolidaysREST
//
//  Created by Bartek on 3/22/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

//import Foundation
////creating failure cases based off the codes from API
//enum HolidayError: Error{
//    case noDataAvailable
//    case canNotProcessData
//}
//
//struct HolidayRequest {
//    let resourceURL: URL
//    let API_KEY = "d6bfa0b9b4b8b8d0cf6043770c73f884f6dd304d"
//
//    init(countryCode: String) {
//        let date = Date()
//        let format = DateFormatter()
//        format.dateFormat = "yyyy"
//        let currentYear = format.string(from: date)
//
//        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
//
//        guard let resourceURL = URL(string: resourceString) else {
//            fatalError()
//
//        }
//
//        self.resourceURL = resourceURL
//
//    }
//    //Happens asynchronously?           Apperantly doing stuff this way is really common
//    func getHolidays(completion: @escaping (Result<[HolidayDetail], HolidayError>) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: resourceURL) {( data, _, _ ) in
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
//                print("Holiday Res: \(holidaysResponse)")
//                let hoildayDetails = holidaysResponse.response.hoildays
//                completion(.success(hoildayDetails))
//                print("Error in success")
//            } catch {
//                completion(.failure(.canNotProcessData))
//                print("Error In Catch method")
//            }
//        }
//        dataTask.resume()
//    }
//
//}
import Foundation


enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}

//This is how we will access the response from the API.
//In here we need to configure all that we would like to access.
struct HolidayRequest {
    
var resourceURL: URL
    
let API_KEY = "d6bfa0b9b4b8b8d0cf6043770c73f884f6dd304d"
    
    init(countryCode : String) {
            
            let date = Date()
            let format = DateFormatter()
            format.dateFormat  = "2019"
            let currentYear = format.string(from: date)
            
            let destinationURL = "https://calendarific.com/api/v2/holidays?&api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
            
            guard let resourceURL = URL(string: destinationURL) else {fatalError()}
            
            self.resourceURL = resourceURL
            
        }


        func getHolidays (compleation: @escaping(Result<[HolidayDetails], HolidayError>) ->Void) {
            let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in

                guard let jsonData = data else {
                    compleation(.failure(.noDataAvailable))
                    return
                }

                do{
                    let decoder = JSONDecoder()
                    let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                    let holidayDetails = holidaysResponse.response.holidays
                    compleation(.success(holidayDetails))
                }catch{
                    compleation(.failure(.canNotProcessData))
                }

            }
            dataTask.resume()
        }
    }
        

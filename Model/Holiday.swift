//
//  HolidayData.swift
//  HolidaysREST
//
//  Created by Bartek on 3/22/20.
//  Copyright © 2020 Bartek. All rights reserved.
//


import Foundation

//this is where we create our data model

/*
 the response is a structure of the other structs maps to the information to the response that we get from our API.
 */

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetails]
}

struct HolidayDetails: Decodable {
    var name: String
    var date: DateInfo
}

struct DateInfo: Decodable {
    var iso: String
}

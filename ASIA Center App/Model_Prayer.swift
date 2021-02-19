//
//  Model_Prayer.swift
//  ASIA Center App
//
//  Created by Ilyas Khurshid on 5/5/19.
//  Copyright © 2019 IKapps. All rights reserved.
//

import Foundation

class Model_Prayer {
    
    var date: String
    var fajrAzaan: String
    var fajrIqama: String
    var sunrise: String
    var zuhrAzaan: String
    var zuhrIqama: String
    var asrAzaan: String
    var asrIqama: String
    var magribAzaan: String
    var ishaAzaan: String
    var ishaIqama: String
    
    init(date: String, fajrAzaan: String, fajrIqama: String, sunrise: String, zuhrAzaan: String, zuhrIqama: String, asrAzaan: String, asrIqama: String, magribAzaan: String, ishaAzaan: String, ishaIqama: String)
    {
        self.date = date
        self.fajrAzaan = fajrAzaan
        self.fajrIqama = fajrIqama
        self.sunrise = sunrise
        self.zuhrAzaan = zuhrAzaan
        self.zuhrIqama = zuhrIqama
        self.asrAzaan = asrAzaan
        self.asrIqama = asrIqama
        self.magribAzaan = magribAzaan
        self.ishaAzaan = ishaAzaan
        self.ishaIqama = ishaIqama
    }
}

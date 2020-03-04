//
//  Time.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation

public class Time: Decodable {
    var stopId: String?
    var realtimeDeparture: Int?
    var serviceDay: Int?
    var realtime: Bool?
    var stopName: String?
    var timeBeforeDeparture: Int? {
        get {
            let since = Date().timeIntervalSinceReferenceDate
            let (days, secondsSinceMidnight) = Int(since).quotientAndRemainder(dividingBy: 86400)
            if (realtimeDeparture == nil) {
                return nil
            }
            return realtimeDeparture! - (secondsSinceMidnight + 3600)
        }
    }
    var minutesBeforeDeparture: Int {
        get {
            let (min, _) = timeBeforeDeparture?.quotientAndRemainder(dividingBy: 60) ?? (0, 0)
            return min
        }
    }
    
    public func displayDepartureTime(precision: String = "min") -> String {
        let (fullMins, sec) = (realtimeDeparture?.quotientAndRemainder(dividingBy: 60))!
        let (hr, min) = fullMins.quotientAndRemainder(dividingBy: 60)
        
        if (precision == "min") {
            return "\(hr):\(min)"
        }
        
        if (precision == "sec") {
            return "\(hr):\(min):\(sec)"
        }
        
        return ""
    }
}

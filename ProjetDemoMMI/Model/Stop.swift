//
//  Stop.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation

public class Stop: Decodable {
    var name: String?
    var lines: [String]?
    var lon: Double?
    var lat: Double?
    var id: String?
    
    init(name: String, lines: [String], lon: Double, lat: Double?, id: String?) {
        self.name = name
        self.lines = lines
        self.lon = lon
        self.lat = lat
        self.id = id
    }
}

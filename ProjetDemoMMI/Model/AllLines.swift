//
//  AllLines.swift
//  ProjetDemoMMI
//
//  Created by Mateo Piccarreta on 03/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation

class AllLines {
    static var lines: [Line]?
    static let api = Api()

    public static func initiate () {
        api.getAllLinesData { (lines) in
            AllLines.lines = lines
        }
    }
        
    static func search(id: String) -> Line? {
        let idArray = id.components(separatedBy: ":")
        let line = lines?.first(where: { (line) -> Bool in
            let currentId = line.id.components(separatedBy: ":")
            return currentId[0] == idArray[0] && currentId[1] == idArray[1]
        })
        
        return line
    }
}

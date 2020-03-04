//
//  Stop.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation
import UIKit

public class Pattern: Decodable {
    var id: String?
    var name: String? {
        get {
            return self.id?.components(separatedBy: ":")[1]
        }
    }
    var category: String? {
        get {
            return self.id?.components(separatedBy: ":")[0]
        }
    }
    var lastStop: String?
    var lastStopName: String?
    var additionalData: Line?
    
    var color: String? {
        get {
            return getAdditionalData()?.color
        }
    }
    
    var uiColor: UIColor? {
        get {
            return self.getAdditionalData()?.uicolor
        }
    }
    
    var uiTextColor: UIColor? {
        get {
            return self.getAdditionalData()?.uiTextcolor
        }
    }
    
    init(id: String?, lastStop: String?, lastStopName: String?) {
        self.id = id
        self.lastStop = lastStop
        self.lastStopName = lastStopName
    }
    
    public func getAdditionalData() -> Line? {
        if (self.additionalData == nil) {
            self.additionalData = AllLines.search(id: self.id!)
        }
        return self.additionalData
    }
}

public class LineTime: Decodable {
    var times: [Time]?
    var pattern: Pattern
}

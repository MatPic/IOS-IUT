//
//  Stop.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation
import UIKit

public class Line: Decodable {
    var id: String
    var gtfsId: String
    var shortName: String
    var longName: String
    var color: String
    var textColor: String
    var uiTextcolor: UIColor {
        get {
            let stringColor: String = self.textColor ?? ""
            return UIColor(hex: "#\(stringColor)") ?? UIColor.red
        }
    }
    var uicolor: UIColor {
        get {
            let stringColor: String = self.color ?? ""
            return UIColor(hex: "#\(stringColor)") ?? UIColor.red
        }
    }
    var mode: String
    var type: String
}

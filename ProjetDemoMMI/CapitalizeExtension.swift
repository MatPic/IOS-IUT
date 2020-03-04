//
//  CapitalizeExtension.swift
//  ProjetDemoMMI
//
//  Created by Mateo Piccarreta on 04/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

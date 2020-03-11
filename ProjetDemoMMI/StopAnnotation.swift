//
//  StopAnnotation.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import Foundation
import MapKit

class StopAnnotation: MKPointAnnotation {
    var id: String?
	
	init(id: String?, coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
		super.init()
		
		self.id = id
		self.coordinate = coordinate
		self.title = title
		self.subtitle = subtitle
	}
    
    static func == (lhs: StopAnnotation, rhs: StopAnnotation) -> Bool {
        let epsilon = 0.0001
        return fabs(lhs.coordinate.latitude - rhs.coordinate.latitude) <= epsilon && fabs(lhs.coordinate.longitude - rhs.coordinate.longitude) <= epsilon
    }
}

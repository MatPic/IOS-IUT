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
}

//
//  ViewController.swift
//  ProjetDemoMMI
//
//  Created by Julie Saby on 27/01/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
	
	@IBOutlet weak var mapView: MKMapView!
	
	let api = Api()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        AllLines.initiate()
        
		self.title = "Bus Stops"
		
		mapView.delegate = self
		
		// Ici, on centre la carte sur la latitude et la longitude passée en paramètre
		let center = CLLocationCoordinate2D(latitude: 45.19130205, longitude: 5.71517336)
		centerMap(onLocation: center)
		popularStops(onLocation: center)
		// On fait appel à la classe API pour récupérer l'ensemble des arrêts autour du point passé en paramètre
		
	}
	
	func centerMap(onLocation location: CLLocationCoordinate2D) {
		let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
		mapView.setRegion(region,animated: true)
    }
    
    func popularStops(onLocation center: CLLocationCoordinate2D) {
        api.getStopPoint(longitude: center.longitude, latitude: center.latitude) { (stops) in
            stops?.forEach({ (stop) in
                DispatchQueue.main.async {
                    let coordinates = CLLocationCoordinate2D(latitude: stop.lat!, longitude: stop.lon!)
                    let stopAnnotation = StopAnnotation(id: stop.id, coordinate: coordinates, title: stop.name, subtitle: "Arrêt de tram")
                    self.mapView.addAnnotation(stopAnnotation)
                }
            })
            
            // TODO: On veut afficher un point sur la carte (une annotation), pour chaque stop
            // L'annotation utilisée sera de type StopAnnotation, pour pouvoir par la suite récupérer l'id de ce stop
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let stopAnnotation = view.annotation as? StopAnnotation {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let timesViewController = storyboard.instantiateViewController(withIdentifier: "TimesViewController") as! TimesViewController
            timesViewController.stopId = stopAnnotation.id!
            timesViewController.stopName = stopAnnotation.title!
            self.navigationController?.pushViewController(timesViewController, animated: true)
        }
        
		
		// TODO: Accéder au viewController TimesViewController afin d'afficher les horaires de cet arrêt
    }
}


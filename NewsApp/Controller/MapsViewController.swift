//
//  MapsViewController.swift
//  NewsApp
//
//  Created by Lucas Nahuel Guerra on 08/07/2024.
//

import CoreLocation
import UIKit
import MapKit

class MapsViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    var userLatitude: Double?
    
    var userLongitude: Double?
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.startUpdatingLocation()
        mapRender()
    }
    
    func mapRender() {
        let coordinate = CLLocationCoordinate2D(latitude: userLatitude ?? 0.0, longitude: userLongitude ?? 0.0)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let pin = MKPointAnnotation()
        
        manager.stopUpdatingLocation()
        mapView.setRegion(region, animated: true)
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

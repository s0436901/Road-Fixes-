//
//  ViewController.swift
//  Road Fixes
//
//  Created by webstudent on 11/9/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, MKMapViewDelegate {
    class Pin: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
        }
        
        }
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func dropPin(sender: UIBarButtonItem) {
        let pin = Pin(coordinate: mapView.userLocation.coordinate)
        mapView.addAnnotation(pin)
        
    }
    @IBAction func Add(sender: AnyObject) {
        
        
    }
    @IBAction func zoomIn(sender: AnyObject) {
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance( userLocation.location! .coordinate, 500, 500)
        mapView.setRegion(region, animated: true)
        let anotation = MKPointAnnotation()
        
        anotation.title = "The Location"
        anotation.subtitle = "This is the location !!!"
        mapView.addAnnotation(anotation)
        let longPress =  UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 0.1
        mapView.addGestureRecognizer(longPress)
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        let touchpoint = gestureRecognizer.locationInView(self.mapView)
        let newCoord:CLLocationCoordinate2D = mapView.convertPoint(touchpoint, toCoordinateFromView: self.mapView)
        let newAnotation = MKPointAnnotation()
        newAnotation.coordinate = newCoord
        newAnotation.title = "New Location"
        newAnotation.subtitle = "New Subtitle"
        mapView.addAnnotation(newAnotation)
        
    
    
        
    
    
        
        
    }
    
    
    @IBAction func changeMapType(sender: AnyObject) {
        if mapView.mapType ==
            MKMapType.Standard {
                mapView.mapType = MKMapType.Satellite }
        else {
            mapView.mapType = MKMapType.Standard
        
        }
        
        
    
   

    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


}

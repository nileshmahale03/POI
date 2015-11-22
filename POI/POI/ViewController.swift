//
//  ViewController.swift
//  POI
//
//  Created by Nilesh Mahale on 11/21/15.
//  Copyright © 2015 Code-Programming. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchText: UITextField!
    
    var matchingItems: [MKMapItem] = [MKMapItem]()
    
    
    override func viewDidLoad() {
        mapView.delegate = self
        super.viewDidLoad()
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func zoomIn(sender: AnyObject) {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func changeMapType(sender: AnyObject) {
        if mapView.mapType == MKMapType.Standard {
            mapView.mapType = MKMapType.Satellite
        } else {
            mapView.mapType = MKMapType.Standard
        }
    }

    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    
    @IBAction func textFieldReturn(sender: AnyObject) {
        sender.resignFirstResponder()
        mapView.removeAnnotations(mapView.annotations)
        self.performSearch()
    }
    
    func performSearch() {
        
        matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchText.text
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.startWithCompletionHandler({(response: MKLocalSearchResponse?, error: NSError?) in
            
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
            }
            
            for item in response!.mapItems {
                print("Name = \(item.name)")
                print("Phone = \(item.phoneNumber)")
                
                self.matchingItems.append(item as MKMapItem)
                print("Matching items = \(self.matchingItems.count)")
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                annotation.subtitle = item.phoneNumber
                self.mapView.addAnnotation(annotation)
            }
        
        })
    }
}











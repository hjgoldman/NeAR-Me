//
//  ARViewController.swift
//  NeAR Me
//
//  Created by Hayden Goldman on 3/14/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import MapKit
import HDAugmentedReality

class CategoryARViewController: ARViewController, ARDataSource, CLLocationManagerDelegate {
    
    var category = Category()
    var locationManager = CLLocationManager()
    var categoryRequestARAnnotations = [ARAnnotation]()
    var categoryRequests = [CategoryRequest]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.dataSource = self
        self.headingSmoothingFactor = 0.05
        self.maxVisibleAnnotations = 30
        
        self.title = self.category.title
        
        self.getSelectedCategoryLocations()
    }
    
    func getSelectedCategoryLocations() {
        
        let categoryRequest = MKLocalSearchRequest()
        categoryRequest.naturalLanguageQuery = self.category.title
        
        let region = MKCoordinateRegionMakeWithDistance((self.locationManager.location?.coordinate)!, 100, 100)

        categoryRequest.region = region
        
        let search = MKLocalSearch(request: categoryRequest)
        search.start { (response :MKLocalSearchResponse?, error: Error?) in
            
            for requestItem in (response?.mapItems)! {
                
                let categoryRequest = CategoryRequest()
                categoryRequest.name = requestItem.name
                categoryRequest.coordinate = requestItem.placemark.coordinate
                
                self.categoryRequests.append(categoryRequest)
            }
            
            for category in self.categoryRequests {
                
                let arAnnotation = ARAnnotation()
                arAnnotation.title = category.name
                
                arAnnotation.location = CLLocation(latitude: category.coordinate.latitude, longitude: category.coordinate.longitude)
                                
                self.categoryRequestARAnnotations.append(arAnnotation)
                self.setAnnotations(self.categoryRequestARAnnotations)
            }
        }
    }
    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        
        let annotationView = ARAnnotationView()
        annotationView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        annotationView.backgroundColor = UIColor.blue
        
        return annotationView
    }
    
    
    
    
    
}

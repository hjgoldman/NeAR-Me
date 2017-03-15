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

class CategoryARViewController: ARViewController, ARDataSource, CLLocationManagerDelegate, SearchCategoryDelegate{
    
    var category = Category()
    var locationManager = CLLocationManager()
    var categoryRequestARAnnotations = [ARAnnotation]()
    var categoryRequests = [CategoryRequest]()
    var searchText :String!

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
    
    func searchCategoryText(searchText :String) {
        self.category.title = searchText
    }

    
    func getSelectedCategoryLocations() {
        
        let categoryRequest = MKLocalSearchRequest()
        
        categoryRequest.naturalLanguageQuery = self.category.title
        
        let region = MKCoordinateRegionMakeWithDistance((self.locationManager.location?.coordinate)!, 200, 200)

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
                
                let annotation = CategoryAnnotation(categoryRequest: category)
                
                self.categoryRequestARAnnotations.append(annotation)
                self.setAnnotations(self.categoryRequestARAnnotations)
//                let arAnnotation = ARAnnotation()
//                arAnnotation.title = category.name
//                arAnnotation.location = CLLocation(latitude: category.coordinate.latitude, longitude: category.coordinate.longitude)
//                                
//                self.categoryRequestARAnnotations.append(arAnnotation)
//                self.setAnnotations(self.categoryRequestARAnnotations)
            }
        }
    }
    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        
        let annotationView = CategoryAnnotationView(annotation: viewForAnnotation)
        
        return annotationView
    }
    
}


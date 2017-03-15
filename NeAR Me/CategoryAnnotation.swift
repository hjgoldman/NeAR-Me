//
//  CategoryAnnotaion.swift
//  NeAR Me
//
//  Created by Hayden Goldman on 3/14/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import Foundation
import UIKit
import HDAugmentedReality
import MapKit

class CategoryAnnotation :ARAnnotation {
    
    var categoryRequest :CategoryRequest!
    
    init(categoryRequest :CategoryRequest) {
        
        super.init()
        
        self.title = categoryRequest.name
        self.location = CLLocation(latitude: categoryRequest.coordinate.latitude, longitude: categoryRequest.coordinate.longitude)
        self.categoryRequest = categoryRequest
    }

    
    
}

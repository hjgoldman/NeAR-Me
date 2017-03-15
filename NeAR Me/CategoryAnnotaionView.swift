//
//  CategoryAnnotaionView.swift
//  NeAR Me
//
//  Created by Hayden Goldman on 3/14/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import Foundation
import UIKit
import HDAugmentedReality

class CategoryAnnotationView :ARAnnotationView {
    
    var annotationView: UIView = UIView()
    var annotationLabel: UILabel = UILabel()

    
    init(annotation :ARAnnotation) {
        super.init()

        let categoryAnnotation = annotation as! CategoryAnnotation
        
        let name = categoryAnnotation.categoryRequest.name
        
        self.annotationView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        self.annotationView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        
        self.annotationLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        self.annotationLabel.text = name
        self.annotationLabel.textColor = UIColor.white
        self.annotationLabel.textAlignment = .center
        self.annotationLabel.center = self.annotationView.center

        
        self.annotationView.addSubview(self.annotationLabel)

        self.addSubview(self.annotationView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    




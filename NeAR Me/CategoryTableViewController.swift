//
//  CategoryTableViewController.swift
//  NeAR Me
//
//  Created by Hayden Goldman on 3/14/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import MapKit

protocol SearchCategoryDelegate {
    func searchCategoryText(searchText :String)
}

class CategoryTableViewController: UITableViewController, UITextFieldDelegate, UISearchBarDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var categorySearchBar: UISearchBar!
    var categories = [Category]()
    var delegate :SearchCategoryDelegate!
    var locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let category1 = Category()
        category1.title = "Banks"
        let category2 = Category()
        category2.title = "Bars"
        let category3 = Category()
        category3.title = "Gas Station"
        let category4 = Category()
        category4.title = "Restaurant"
        let category5 = Category()
        category5.title = "Museums"
        let category6 = Category()
        category6.title = "Parks"
        let category7 = Category()
        category7.title = "Taco"

        self.categories.append(category1)
        self.categories.append(category2)
        self.categories.append(category3)
        self.categories.append(category4)
        self.categories.append(category5)
        self.categories.append(category6)
        self.categories.append(category7)

        self.title = "NeAR Me"
        
        self.categorySearchBar.delegate = self
        
        //location manager stuff 
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar) {
        
        var searchText = String()
        searchText = self.categorySearchBar.text!
        
        self.delegate?.searchCategoryText(searchText: searchText)

        self.performSegue(withIdentifier: "ShowSearch", sender: self.delegate)

        print(searchText)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCategory" {
            guard let indexPath: IndexPath = self.tableView.indexPathForSelectedRow else {
                fatalError("no selection made")
            }
            let selectedCategory = self.categories[indexPath.row]
            let arVC = segue.destination as! CategoryARViewController
            arVC.category = selectedCategory
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = self.categories[indexPath.row]
        cell.textLabel?.text = category.title
        return cell
    }
}

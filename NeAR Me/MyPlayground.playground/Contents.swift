//: Playground - noun: a place where people can play
import UIKit
// PlaygroundSupport replaces XCPlayground
import PlaygroundSupport


//import CoreLocation
import MapKit

let coordinate1 = CLLocation(latitude: 5.0, longitude: 5.0)
let coordinate2 = CLLocation(latitude: 5.0, longitude: 3.0)

let distanceInMeters = coordinate1.distance(from: coordinate2)




let annotationView = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 100))

annotationView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

var annotationNameLabel = UILabel(frame: CGRect(x: 0, y: 7, width: 125, height: 15))

annotationNameLabel.text = "Houston's"
annotationNameLabel.textColor = UIColor.white
annotationNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
annotationNameLabel.textAlignment = .center
//annotationNameLabel.center = annotationView.center

annotationView.addSubview(annotationNameLabel)

var annotationAddressLabel = UILabel(frame: CGRect(x: 0, y: annotationNameLabel.frame.size.height + 10, width: 125, height: 50))
annotationAddressLabel.text = "4848 Kirby Drive Houston, Texas 77098"
annotationAddressLabel.textColor = UIColor.white
annotationAddressLabel.font = UIFont.systemFont(ofSize: 12)
annotationAddressLabel.textAlignment = .center
annotationAddressLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
annotationAddressLabel.numberOfLines = 0

annotationView.addSubview(annotationAddressLabel)

var annotationDistanceLabel = UILabel(frame: CGRect(x: 0, y: annotationAddressLabel.frame.size.height + 7, width: 125, height: 50))
annotationDistanceLabel.text = "1.23 Miles Away"
annotationDistanceLabel.textColor = UIColor.white
annotationDistanceLabel.font = UIFont.systemFont(ofSize: 10)
annotationDistanceLabel.textAlignment = .center

annotationView.addSubview(annotationDistanceLabel)


// PlaygroundPage replaces XCPlaygroundPage, current replaces currentPage
PlaygroundPage.current.liveView = annotationView

// as before, for any UI stuff, set needsIndefiniteExecution to true so your playground doesn't terminate after execution
PlaygroundPage.current.needsIndefiniteExecution = true
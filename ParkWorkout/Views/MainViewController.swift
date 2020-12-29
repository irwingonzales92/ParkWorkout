//
//  ViewController.swift
//  ParkWorkout
//
//  Created by Irwin Gonzales on 12/27/20.
//

import UIKit
import MapKit

class MainViewController: UIViewController {
    
    var mapView : MKMapView = {
        var map = MKMapView()
        return map
    }()
    
    var searchTextField : UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .black
        textField.placeholder = "Search For Park"
        return textField
    }()
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackground()
        configureLocationManager()
        configureUI()
    }
    
    /// Configure CLLocationManager
    func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    /// Configure Background
    func configureBackground() {
        view.backgroundColor = .lightGray
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            view.backgroundColor = .systemPurple

        case .light:
            view.backgroundColor = .white
            
        default:
            break
        }
    }
    
    func configureUI() {
        // Add Subviews
        [searchTextField, mapView].forEach { self.view.addSubview($0) }
        
        
        self.searchTextField.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.mapView.topAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, size: .init(width: self.view.frame.width, height: 25))
        
        
        
        self.mapView.anchor(top: self.searchTextField.bottomAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor)
    }

}







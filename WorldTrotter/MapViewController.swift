//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Luis Cortes on 6/30/20.
//  Copyright © 2020 Luis Cortes. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
        
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as "the" view of this view controller
        view = mapView
        
        // Add segmented controls
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let poiLabel = UILabel.init()
        poiLabel.text = "Points of Interest"
        
        view.addSubview(poiLabel)
        
        let uiSwitch = UISwitch.init()
        view.addSubview(uiSwitch)
        
        // Constrain segmented controls based on super view
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        let margins = view.layoutMarginsGuide
        segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Point of intereset
        poiLabel.translatesAutoresizingMaskIntoConstraints = false
        poiLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        
        // UI Switch
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor).isActive = true
        uiSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        
        uiSwitch.addTarget(self, action: #selector(mapSwitchChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    @objc func mapSwitchChanged(_ uiSwitch: UISwitch) {
        if uiSwitch.isOn {
            print("switch on!")
        } else {
            print("switch off")
        }
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
}

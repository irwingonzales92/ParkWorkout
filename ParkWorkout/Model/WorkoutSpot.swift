//
//  WorkoutSpot.swift
//  ParkWorkout
//
//  Created by Irwin Gonzales on 12/28/20.
//

import Foundation
import MapKit

class WorkoutSpot: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}

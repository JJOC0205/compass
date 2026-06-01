//
//  CompassHeading.swift
//  compass
//
//  Created by Jonathon O'CONNELL on 5/31/26.
//

import Foundation
import Combine
import CoreLocation

class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero{
        didSet {
            objectWillChange.send()
        }
    }
    private let locationManeger: CLLocationManager
    
    override init() {
        self.locationManeger = CLLocationManager()
        super.init()
        
        self.locationManeger.delegate = self
        self.setup()
    }
    
    private func setup(){
        self.locationManeger.requestWhenInUseAuthorization( )
        
        if CLLocationManager.headingAvailable( ) {
            self.locationManeger.startUpdatingLocation( )
            self.locationManeger.startUpdatingHeading( )
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateHeading newHeading: CLHeading){
        self.degrees = -1 * newHeading.magneticHeading
    }
}

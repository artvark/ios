import Foundation
import CoreLocation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func startUpdating() {
        if statusString == "notDetermined" {
            self.locationManager.requestWhenInUseAuthorization()
        } else if statusString == "authorizedWhenInUse" {
            self.locationManager.startUpdatingLocation()
        }
        
        print("here")
    }

    @Published var locationStatus: CLAuthorizationStatus? = nil
    // @Published var lastLocation = MKUserLocation()
    // @Published var lastLocation = CLLocation(latitude: 37.32718130, longitude: -122.02684864)

    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }

        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        self.startUpdating()
        print(#function, statusString)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //lastLocation = locations.last!
        //print(lastLocation)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // lastLocation = userLocation
    }

}

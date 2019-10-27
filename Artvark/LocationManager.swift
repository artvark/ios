import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    var objectWillChange = PassthroughSubject<LocationManager, Never>()

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
    @Published var lastLocation = CLLocation(latitude: 37.32718130, longitude: -122.02684864) {
        didSet {
            objectWillChange.send(self)
        }
    }

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
        lastLocation = locations.last!
        print(lastLocation)
    }

}

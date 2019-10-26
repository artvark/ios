////
////  MapViewController.swift
////  Artvark
////
////  Created by Taabish Kathawala on 10/25/19.
////  Copyright © 2019 Bag O. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//import MapKit
//import CoreLocation
//
//
//struct MapViewControllerWrapper: UIViewControllerRepresentable {
//    typealias UIViewControllerType = MapViewController
//
//    var controllers: [UIViewController]
//    @Binding var currentPage: Int
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> MapViewController {
//        let mapViewController = MapViewController()
//        mapViewController.dataSource = context.coordinator
//        mapViewController.delegate = context.coordinator
//
//        return mapViewController
//    }
//
//    func updateUIViewController(_ mapViewController: MapViewController, context: Context) {
//    }
//
//    class Coordinator: NSObject, MapViewControllerWrapperDataSource, MapViewControllerWrapperDelegate {
//        var parent: MapViewControllerWrapper
//
//        init(_ mapViewController: MapViewControllerWrapper) {
//            self.parent = mapViewController
//        }
//
//        func pageViewController(
//            _ mapViewController: MapViewControllerWrapper,
//            viewControllerBefore viewController: UIViewController) -> UIViewController?
//        {
//            guard let index = parent.controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            if index == 0 {
//                return parent.controllers.last
//            }
//            return parent.controllers[index - 1]
//        }
//
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            viewControllerAfter viewController: UIViewController) -> UIViewController?
//        {
//            guard let index = parent.controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            if index + 1 == parent.controllers.count {
//                return parent.controllers.first
//            }
//            return parent.controllers[index + 1]
//        }
//
//        func pageViewController(_ mapViewController: MapViewControllerWrapper, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//            if completed,
//                let visibleViewController = mapViewController.controllers.first,
//                let index = parent.controllers.firstIndex(of: visibleViewController)
//            {
//                parent.currentPage = index
//            }
//        }
//    }
//
//
//}
//
//class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
//    let mapView = MKMapView()
//    var locationManager: CLLocationManager?
////
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("Here")
//        locationManager = CLLocationManager()
//
//        mapView.delegate = self
//        mapView.mapType = .standard
//        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = false
//
//        locationManager?.delegate = self
//        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
//            locationManager?.requestWhenInUseAuthorization()
//        }
//
//        if let coor = mapView.userLocation.location?.coordinate{
//            mapView.setCenter(coor, animated: true)
//        }
//
//    }
//
//    func locationManager(_ manager
//        : CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        print("Callback")
//        if (status == .authorizedWhenInUse) {
//            manager.startUpdatingLocation();
//        } else {
//            print("Denied location services")
//        }
//    }
//
//    func getLocationManger() -> CLLocationManager {
//        return locationManager ?? CLLocationManager()
//    }
//
//}
//
//

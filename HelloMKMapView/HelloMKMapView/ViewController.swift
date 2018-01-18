//
//  ViewController.swift
//  HelloMKMapView
//
//  Created by jacky on 2017/11/23.
//  Copyright © 2017年 jacky. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBAction func addMeAnnotation(_ sender: UILongPressGestureRecognizer) {
        //手指觸碰地圖的位置,不是地圖座標
        let touchPoint = sender.location(in: map)
        //將觸碰的點轉換成地圖座標
        let touchCordinate:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: map)
        
        //放入大圖針
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchCordinate
        annotation.title = "New Place"
        annotation.subtitle = "One day I will be here"
        map.addAnnotation(annotation)
        
    }
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //座標位置
        let latitude:CLLocationDegrees = 48.858547
        let longtitude:CLLocationDegrees = 2.294524
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        //放大比例
        let xScale:CLLocationDegrees = 0.01
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: xScale, longitudeDelta: yScale)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        //map.mapType = .satellite
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


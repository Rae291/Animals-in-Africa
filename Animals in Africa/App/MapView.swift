//
//  MapView.swift
//  Animals in Africa
//
//  Created by APPLE on 03/10/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - Property
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK: - Body
    var body: some View {
        
        //MARK: - Map With Annotations
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            
            //Map Annotations
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }// eo Map
        .overlay(
            MapInfoPanelView(
                latitude: region.center.latitude,
                longitude: region.center.longitude),
            alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

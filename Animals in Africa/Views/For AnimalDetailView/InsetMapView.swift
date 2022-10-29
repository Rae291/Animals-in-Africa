//
//  InsetMapView.swift
//  Animals in Africa
//
//  Created by APPLE on 09/10/22.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    //MARK: - Property
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .font(.body)
                        
                    }// eo HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color
                            .black
                            .opacity(0.3 )
                            .cornerRadius(8)
                    )
                    
                }// eo NavigationLink
                    .padding(12)
                , alignment: .topTrailing
                
            )// eo overlay
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

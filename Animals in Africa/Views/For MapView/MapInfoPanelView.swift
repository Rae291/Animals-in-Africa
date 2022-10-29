//
//  MapInfoPanelView.swift
//  Animals in Africa
//
//  Created by APPLE on 09/10/22.
//

import SwiftUI
import MapKit

struct MapInfoPanelView: View {
    
    //MARK: - Property
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    @State private var isInfoPanelVisible: Bool = false
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                .background(
                    Color
                        .black
                        .cornerRadius(8)
                        .opacity(0.5)
                )
                .onTapGesture {
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            
            VStack(alignment: .leading, spacing: 3) {
                HStack{
                    Text("Latitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        
                    Spacer()
                    
                    Text("\(latitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
                
                Divider()
                
                HStack{
                    Text("Longitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        
                    Spacer()
                    
                    Text("\(longitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }// eo VStack
            .frame(height: 48)
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(
                Color
                    .black
                    .cornerRadius(8)
                    .opacity(0.5)
            )
            .opacity(isInfoPanelVisible ? 1 : 0)
        }// eo HStack
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        MapInfoPanelView(latitude: 6.600286, longitude: 16.4377599)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  GalleryView.swift
//  Animals in Africa
//
//  Created by APPLE on 03/10/22.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - Property
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var  gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                
                //MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                
                //MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        withAnimation(.easeIn(duration: 0.7)) {
                            gridSwitch()
                        }
                    }
                
                //MARK: - Grid
                 LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }// eo Loop
                    
                }// eo Grid
                 .onAppear {
                     gridSwitch()
                 }
                
            }// eo VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }// eo ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

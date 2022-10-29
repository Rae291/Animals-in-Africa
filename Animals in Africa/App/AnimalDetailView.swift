//
//  AnimalDetailView.swift
//  Animals in Africa
//
//  Created by APPLE on 06/10/22.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - Property
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .center, spacing: 20) {
                
                //Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                
                //Title
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color
                            .accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.pname)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }// eo VStack
            .navigationTitle("Learn about \(animal.pname)")
            .navigationBarTitleDisplayMode(.inline)
            
        }// eo ScrollView
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}

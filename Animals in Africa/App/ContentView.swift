//
//  ContentView.swift
//  Animals in Africa
//
//  Created by APPLE on 03/10/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - Functions
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        //ToolBar Icon
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            
            Group{
                
                if !isGridViewActive {
                    List {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }// eo NavigationLink
                        }// eo Loop
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    }// eo List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10 ) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }// eo LazyVGrid
                        .padding(10)
                        
                    }// eo ScrollView
                }// eo Condition
                
            }// eo Group
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        
                        //List
                        Button {
                            print("123")
                            isGridViewActive = false
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button {
                            isGridViewActive = true
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }

                        
                    }// eo HStack
                }// eo Toolbar Items
            }// eo Toolbar
        }// eo Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  InsetFactView.swift
//  Animals in Africa
//
//  Created by APPLE on 06/10/22.
//

import SwiftUI

struct InsetFactView: View {
    
    //MARK: - Property
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 185, maxHeight: 200)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[7])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  ExternalWebLinkView.swift
//  Animals in Africa
//
//  Created by APPLE on 09/10/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    //MARK: - Property
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Text("\(Image(systemName: "globe")) Wikipedia")
                Spacer()
                
                Group{
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }
        }// eo GroupBox
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

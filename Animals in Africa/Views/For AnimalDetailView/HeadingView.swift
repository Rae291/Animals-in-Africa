//
//  HeadingView.swift
//  Animals in Africa
//
//  Created by APPLE on 06/10/22.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: - Property
    var headingImage: String
    var headingText: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

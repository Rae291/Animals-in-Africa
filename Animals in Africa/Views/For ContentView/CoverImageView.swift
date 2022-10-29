//
//  CoverImageView.swift
//  Animals in Africa
//
//  Created by APPLE on 03/10/22.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - Property
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    @State private var coverIndex = 1
    
    //MARK: - Function
    func nextTabView() {
        if coverIndex < coverImages.count {
            coverIndex += 1
        } else {
            coverIndex = 1
        }
    }
    
    //MARK: - Body
    var body: some View {
        TabView(selection: $coverIndex) {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeIn(duration: 0.7), value: coverIndex)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (timer) in
                nextTabView()
            }
        }
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

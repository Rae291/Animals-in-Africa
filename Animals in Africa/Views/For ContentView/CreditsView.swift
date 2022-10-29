//
//  CreditsView.swift
//  Animals in Africa
//
//  Created by APPLE on 18/10/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Twisha Solgama
    All rights reserved.
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.5)
        
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

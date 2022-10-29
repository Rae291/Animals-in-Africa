//
//  CenterModifier.swift
//  Animals in Africa
//
//  Created by APPLE on 18/10/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack(){
            Spacer()
            content
            Spacer()
        }
    }
}

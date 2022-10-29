//
//  MotionAnimationView.swift
//  Animals in Africa
//
//  Created by APPLE on 09/10/22.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK: - Property
    @State private var randomCircle = Int.random(in: 12...18)
    @State private var isAnimating: Bool = false
    
    //MARK: - Functions
    
    //Random Coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //Random Size
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 50...350))
    }
    
    //Random Scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //Random Speed
    func randomSpeed() -> Double  {
        return Double.random(in: 0.025...0.7)
    }
    
    //Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0.0...2.0)
    }
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                ForEach(0...randomCircle, id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.12)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation
                                .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()),
                            value: isAnimating
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }// eo Loop
            }// eo ZStack
            .drawingGroup()
        }// eo GeometryReader
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

//
//  ViewfinderView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct ViewfinderView: View {
    @Binding var image: Image?
    
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            } else {
                Rectangle()
                    .fill(.black)
            }
        }
    }
}

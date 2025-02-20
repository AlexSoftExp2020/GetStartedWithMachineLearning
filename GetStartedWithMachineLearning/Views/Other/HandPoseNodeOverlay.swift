//
//  HandPoseNodeOverlay.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct HandPoseNodeOverlay: View {
    var size: CGSize
    var points: [CGPoint] = []

    private let radius: CGFloat = 4
    
    private var imageAspectRatio: CGFloat {
        size.width / size.height
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

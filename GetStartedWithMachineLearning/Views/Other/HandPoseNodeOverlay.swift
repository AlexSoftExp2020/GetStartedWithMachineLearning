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
        GeometryReader { geo in
            if points.isEmpty {
                EmptyView()
            } else {
                VStack {
                    Path {
                        path in
                        path.move(to: points[0])
                        for point in points {
                            let updatedPoint = updatePoint(point, viewSize: geo.size)
                            path.addEllipse(in: CGRect(x: updatedPoint.x - radius,
                                                       y: updatedPoint.y - radius,
                                                       width: radius * 2,
                                                       height: radius * 2))
                        }
                    }
                    .foregroundColor(.accent)
                    .clipped()
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            }
        }
    }
}

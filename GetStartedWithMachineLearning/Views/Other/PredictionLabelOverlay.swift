//
//  PredictionLabelOverlay.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct PredictionLabelOverlay: View {
    private var gameMoves: [String: GameMove] {
        return GameModel().validMoves
    }

    private var icon: String {
        gameMoves[label]?.icon ?? GameMove.unknown.icon
    }

    @ScaledMetric private var size: CGFloat = 80

    var label: String
    var showIcon: Bool = true
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

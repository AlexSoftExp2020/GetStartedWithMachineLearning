//
//  GameView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        RPSGameView(isMLGame: false)
            .environmentObject(appModel)
    }
}

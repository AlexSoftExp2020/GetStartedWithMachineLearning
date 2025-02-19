//
//  MLGameView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import SwiftUI

struct MLGameView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        RPSGameView(isMLGame: true)
            .environmentObject(appModel)
    }
}

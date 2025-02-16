//
//  GetStartedWithMachineLearningApp.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 16.02.2025.
//

import SwiftUI

@main
struct GetStartedWithMachineLearningApp: App {
    @StateObject var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(appModel)
            //#-learning-code-snippet(mlgameview.replace)
            .task {
                await appModel.useLastTrainedModel()
            }
        }
    }
}

//
//  DebugModeView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import SwiftUI

struct DebugModeView: View {
    @EnvironmentObject var appModel: AppModel

    private var livePredictionData: [PredictionMetric] {
        return appModel.predictionProbability.data
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                CameraView(showNodes: true)
                    .environmentObject(appModel)
                    .overlay(alignment: .bottomTrailing) {
                        PredictionLabelOverlay(label: appModel.predictionLabel, showIcon: false)
                    }
                predictionBarChart()
            }
            .task {
                await appModel.findExistingModels()
            }
            .toolbar {
                availableMLModelsToolbarItem()
            }
        }
        .accentColor(.accent)
    }

    private func predictionBarChart() -> some View {
        VStack {
            Chart(livePredictionData, id: \.category) {
                BarMark(xStart: .value("zero", 0.0),
                        xEnd: .value("Probability", $0.value),
                        y: .value("Category", $0.category))
            }
            .chartXScale(domain: 0...1)
            .chartXAxisLabel("Confidence")
            .chartXAxis(.visible)
            .chartYAxis(.visible)
            .animation(.easeIn, value: livePredictionData)
            .foregroundColor(.accent)
        }
        .modifier(ChartViewStyle())
    }

    private func availableMLModelsToolbarItem() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink {
                MLModelListView()
                    .environmentObject(appModel)
            } label: {
                Text("ML Models")
            }
        }
    }
}

#Preview {
    DebugModeView()
        .environmentObject(AppModel())
}

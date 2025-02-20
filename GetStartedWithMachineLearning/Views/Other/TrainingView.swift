//
//  TrainingView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct TrainingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.displayScale) private var displayScale

    @EnvironmentObject var appModel: AppModel
    @ObservedObject var trainerDataModel: TrainerDataModel
    @State private var modelName: String = ""
    @State private var chosenValidationDataset: String = ""
    @Binding var newDatasets: [Dataset]
    @FocusState private var focusField: Bool
    
    private var trainingDataset: Dataset? {
        trainerDataModel.currentTrainingDataset
    }

    private var validationDataset: Dataset? {
        trainerDataModel.currentValidationDataset
    }

    private var completed: Int {
        Int(trainerDataModel.completed)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            if trainerDataModel.currentState == .active {
                trainingSessionInfo()
            } else {
                modelNameTextField()
                datasets()
            }
        }
        .padding(.horizontal)
        .toolbar {
            cancelButton()
            trainButton()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(trainingDataset?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: trainerDataModel.currentState) { _ in
            switch trainerDataModel.currentState {
            case .finished, .error:
                closeView()
            default: break
            }
        }
    }
}

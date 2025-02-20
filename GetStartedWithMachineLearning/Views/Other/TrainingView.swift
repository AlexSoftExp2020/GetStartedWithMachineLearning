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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TrainingView()
}

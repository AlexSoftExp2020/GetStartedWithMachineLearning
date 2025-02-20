//
//  MLModelListView.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct MLModelListView: View {
    @EnvironmentObject var appModel: AppModel
    @State private var selection: HandPoseMLModel?
    
    private var mlModels: [HandPoseMLModel] {
        Array(appModel.availableHandPoseMLModels)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(mlModels) { mlModel in
                Button {
                    selection = mlModel
                    appModel.currentMLModel = mlModel
                } label: {
                    mlModelView(mlModel, isSelected: selection == mlModel)
                }
                .buttonStyle(.plain)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Available ML Models")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selection = appModel.currentMLModel
        }
    }
}

#Preview {
    MLModelListView()
}

//
//  TrainingDatasetImageGrid.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 20.02.2025.
//

import SwiftUI

struct TrainingDatasetImageGrid: View {
    @Environment(\.displayScale) private var displayScale
    private let columns = [
        GridItem(.adaptive(minimum: Constants.photoSize.width, maximum: Constants.photoSize.height), spacing: Constants.photoSpacing)
    ]

    private var directory: URL? {
        dataset.directory?.appending(path: label, directoryHint: .isDirectory)
    }
    
    private var toolBarItemText: String {
        isInEditMode ? "Done" : "Edit"
    }
    
    @ObservedObject var trainerDataModel: TrainerDataModel
    @StateObject private var photoPickerDataModel = PhotoPickerDataModel()
    @State private var isInEditMode: Bool = false
    @State private var images: [URL] = []

    var dataset: Dataset
    
    var label: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TrainingDatasetImageGrid()
}

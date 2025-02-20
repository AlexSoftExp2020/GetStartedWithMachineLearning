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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MLModelListView()
}

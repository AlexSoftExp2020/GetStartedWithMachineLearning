//
//  AppModel.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 16.02.2025.
//

import SwiftUI
import Vision
import CoreML

final class AppModel: ObservableObject {
    static let defaultMLModelName = "rockpaperscissors.mlmodel"
    let camera = MLCamera()
    let predictionTimer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    @Published var currentMLModel: HandPoseMLModel? {
        didSet {
            guard let model = currentMLModel else { return }
            camera.mlDelegate?.updateMLModel(with: model)
        }
    }
    
    @Published var defaultMLModel: HandPoseMLModel?
    @Published var availableHandPoseMLModels = Set<HandPoseMLModel>()
    
    @Published var nodePoints: [CGPoint] = []
    @Published var isHandInFrame: Bool = false

    @Published var predictionProbability = PredictionMetrics()
    @Published var canPredict: Bool = false
    @Published var predictionLabel: String = ""
    @Published var isGatheringObservations: Bool = true

    @Published var viewfinderImage: Image?
    @Published var shouldPauseCamera: Bool = false {
        didSet {
            if shouldPauseCamera {
                camera.stop()
                isGatheringObservations = false
            } else {
                Task {
                    await camera.start()
                }
            }
        }
    }
    
    private var handposeMLModelURLs: [URL] {
         let urls = availableHandPoseMLModels.map { $0.url }
         return urls
     }
     
     init() {
         camera.mlDelegate = self
         setDefaultMLModel()
         Task {
             await handleCameraPreviews()
         }
     }
    
    func findExistingModels() async {
        let models = await HandPoseMLModel.findExistingModels(exclude: handposeMLModelURLs)
        for model in models {
            availableHandPoseMLModels.insert(model)
        }
    }
    
    func useLastTrainedModel() async {
        guard let lastTrained = await HandPoseMLModel.getLastTrainedModel() else {
            print("Couldn't find any recently trained ML models.")
            return
        }
        
        Task { @MainActor in
            self.currentMLModel = lastTrained
            print("Using last trained ML model in your RPS game: \(lastTrained.name)")
        }
    }
}

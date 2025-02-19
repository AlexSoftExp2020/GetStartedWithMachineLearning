//
//  Metrics.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import Foundation
import CreateML

struct TrainingMetric: Identifiable {
    var id: Double { x }
    let x: Double
    let y: Double
}

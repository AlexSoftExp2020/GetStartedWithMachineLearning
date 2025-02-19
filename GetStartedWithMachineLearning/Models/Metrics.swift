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

class TrainingMetrics: ObservableObject {
    var allMetricTypes = [String]()
    var data: [String: [TrainingMetric]] = [:]
    
    init() {}
    
    func addDatapointForType(type: String, x: Double, y: Double) {
        let metric = TrainingMetric(x: x, y: y)
        if var currentMetricArray = data[type] {
            currentMetricArray.append(metric)
            data[type] = currentMetricArray
        } else {
            allMetricTypes.append(type)
            data[type] = [metric]
        }
    }
}

struct PredictionMetric: Identifiable {
    var id: String { category }
    let category: String
    let value: Double
}

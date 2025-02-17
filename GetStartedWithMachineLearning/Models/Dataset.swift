//
//  Dataset.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 17.02.2025.
//

import SwiftUI

final class Dataset: ObservableObject, Identifiable {
    @Published var name: String
    @Published var isNew: Bool
    let type: DatasetType
    let moves: [String]

    var resourceDirectory: URL?

    var directory: URL? {
        return baseDirectory?.appendingPathComponent(name, isDirectory: true)
    }

    var hasEnoughImages: Bool {
        guard !subDirectories.isEmpty else { return false }
        let subDirectoryImageCounts = subDirectories.map { getImageCount(for: $0) }
        return !subDirectoryImageCounts.contains { $0 < 7 }
    }

    private var baseDirectory: URL? {
        switch type {
        case .training:
            return URL.trainingDirectoryinDoc
        case .validation:
            return URL.validationDirectoryinDoc
        }
    }

    private var subDirectories: [URL] {
        guard let directory = directory else { return [] }
        var subDirs: [URL] = []
        for move in moves {
            subDirs.append(directory.appendingPathComponent(move.capitalized, isDirectory: true))
        }
        return subDirs
    }
}

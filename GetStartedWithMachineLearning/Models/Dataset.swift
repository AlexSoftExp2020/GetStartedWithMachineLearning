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
    
    init(name: String? = nil, type: DatasetType, moves: [String], resourceDirectory: URL? = nil, isNew: Bool = false) {
        self.name = name ?? "New Dataset"
        self.type = type
        self.moves = moves
        self.isNew = isNew

        if let dir = resourceDirectory {
            copyToDocumentDirectory(dir)
        } else {
            createDirectories()
        }
    }
    
    func getTotalImageCount() -> Int {
        return directory?.getTotalFilesInDataset() ?? 0
    }
    
    func getImageCount(for subDirectory: URL) -> Int {
        return subDirectory.directoryContents.count
    }
    
    func getImages(from subDirectory: URL) -> [URL] {
        let directory = subDirectories.first(where: { $0.lastPathComponent == subDirectory.lastPathComponent })
        return directory?.directoryContents ?? []
    }
    
    func getImages(from subDirectoryName: String) -> [URL] {
        let directory = subDirectories.first(where: { $0.lastPathComponent == subDirectoryName })
        return directory?.directoryContents ?? []
    }
}

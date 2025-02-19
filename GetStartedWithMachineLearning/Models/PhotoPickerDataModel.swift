//
//  PhotoPickerDataModel.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 19.02.2025.
//

import SwiftUI
import PhotosUI

class PhotoPickerDataModel: ObservableObject {
    @Published var selection: [PhotosPickerItem] = []
    
    func addImageFromPickerItem(_ pickerItem: PhotosPickerItem, to directory: URL) async {
        do {
            guard let imageFile = try await pickerItem.loadTransferable(type: PhotoFile.self) else { return  }
             let destURL = directory.appending(path: imageFile.name, directoryHint: .notDirectory)
            try FileManager.default.moveItem(at: imageFile.url, to: destURL)
        } catch {
            print("Error creating item from picked photo: \(error.localizedDescription)")
        }
    }
}

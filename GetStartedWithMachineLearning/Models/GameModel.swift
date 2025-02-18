//
//  GameModel.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 18.02.2025.
//

import SwiftUI

final class GameModel: ObservableObject {
    static var countDown: Int = 3
    let gameTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let rotationTimer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    var playButtonText: String = "Play"
    var validMoves: [String: GameMove] = [:]
    lazy var validMoveNames: [String] = {
        return validMoves.values.map { $0.name }
    }()

    @Published var countDown: Int = GameModel.countDown
    @Published var currentState: GameState = .notPlaying
    @Published var yourMoveName: String = GameMove.unknown.name
    @Published var computersMoveName: String = GameMove.unknown.name

    private var yourMove: GameMove {
        validMoves[yourMoveName] ?? GameMove.unknown
    }
    
    private var computersMove: GameMove {
        validMoves[computersMoveName] ?? GameMove.unknown
    }
}

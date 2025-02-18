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
    
    init() {
        let rock = GameMove(name: "rock", icon: "✊")
        let paper = GameMove(name: "paper", icon: "✋")
        let scissors = GameMove(name: "scissors", icon: "✌️")

        rock.beats([scissors])
        paper.beats([rock])
        scissors.beats([paper])

        validMoves[rock.name] = rock
        validMoves[paper.name] = paper
        validMoves[scissors.name] = scissors
    }
    
    func updateGameState() {
        switch currentState {
        case .notPlaying:
            currentState = .playing
        case .playing:
            currentState = .notPlaying
        case .finished:
            currentState = .playing
        }
    }
    
    func updateComputersMove() {
        guard currentState == .playing else { return }
        let nextMove = rotateThroughValidMoves(computersMoveName)
        computersMoveName = nextMove.name
    }
    
    func updateGameResultText() -> String {
        var text = ""
        
        guard currentState == .finished else { return text }

        let result = getGameResult()
        
        switch result {
        case .win: text = "YOU WIN"
        case .lose: text = "YOU LOSE"
        case .tie: text = "TIE"
        case .inconclusive: text = "INCONCLUSIVE"
        }

        return text
    }
}

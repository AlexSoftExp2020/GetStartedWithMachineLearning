//
//  GameMove.swift
//  GetStartedWithMachineLearning
//
//  Created by Oleksii on 18.02.2025.
//

import SwiftUI

final class GameMove {
    static var unknown = GameMove(name: "unknown", icon: "questionmark")
    var name: String
    var icon: String
    var beatsMoves: [GameMove] = []

    init(name: String, icon: String) {
        self.name = name.capitalized
        self.icon = icon
    }
    
    func beats(_ moves: [GameMove]) {
        beatsMoves += moves
    }
    
    func isWinner(comparedTo move: GameMove) -> Bool {
        return beatsMoves.contains { $0 == move }
    }

    func compare(to move: GameMove) -> GameResult {
        if isWinner(comparedTo: move) {
            return .win
        } else if move.isWinner(comparedTo: self) {
            return .lose
        }
        return .tie
    }
}

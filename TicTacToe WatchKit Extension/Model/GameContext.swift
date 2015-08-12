//
//  GameContext.swift
//  TicTacToe
//
//  Created by iOS Developer on 12.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit

class GameContext {
    enum Level {
        case Easy
        case Normal
        case Hard
    }
    
    enum Result {
        case Undefined
        case XWin
        case OWin
        case Draw
    }
    
    enum Player {
        case X
        case O
    }
    
    var level: Level = .Easy;
    var gridSize = 3;
    var result: Result = .Undefined;
    var player: Player = .X;
    var currentTurn: Player = .X;
    var turnsCount = 0;
}

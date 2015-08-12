//
//  Point.swift
//  TicTacToe
//
//  Created by iOS Developer on 13.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit

struct Point {
    enum State {
        case Empty
        case X
        case O
    }
    
    var row: Int32;
    var col: Int32;
}

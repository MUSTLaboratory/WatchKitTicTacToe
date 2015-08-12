//
//  Board.swift
//  TicTacToe
//
//  Created by iOS Developer on 13.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit

class Board {
    private var cols: Int;
    private var rows: Int;
    private var data: Array<Point.State>;
    
    required init(rows: Int, cols: Int) {
        self.cols = cols;
        self.rows = rows;
        self.data = Array<Point.State>(count: rows * cols, repeatedValue: .Empty);
    }
    
    private func index(from point: Point) -> Int {
        return (point.row - 1) * self.cols + (point.col - 1);
    }
    
    func points() -> Int {
        return self.cols * self.rows;
    }
    
    func getState(at point: Point) -> Point.State {
        return self.data[self.index(from: point)];
    }
    
    func setState(at point: Point, state: Point.State) {
        self.data[self.index(from: point)] = state;
    }
    
    func result() -> GameContext.Result {
        let winningRows: [[Point]] = [
            [Point(row: 1, col: 1), Point(row: 1, col: 2), Point(row: 1, col: 3)],
            [Point(row: 2, col: 1), Point(row: 2, col: 2), Point(row: 2, col: 3)],
            [Point(row: 3, col: 1), Point(row: 3, col: 2), Point(row: 3, col: 3)],
            [Point(row: 1, col: 1), Point(row: 2, col: 1), Point(row: 3, col: 1)],
            [Point(row: 1, col: 2), Point(row: 2, col: 2), Point(row: 3, col: 2)],
            [Point(row: 1, col: 3), Point(row: 2, col: 3), Point(row: 3, col: 3)],
            [Point(row: 1, col: 1), Point(row: 2, col: 2), Point(row: 3, col: 3)],
            [Point(row: 1, col: 3), Point(row: 2, col: 2), Point(row: 3, col: 1)]
        ];
        
        var result: GameContext.Result = .Undefined;
        
        for row in winningRows {
            var xCount = 0, oCount = 0;
            
            for point in row {
                let state = self.getState(at: point);
                
                if state == .X {
                    xCount++;
                } else if state == .O {
                    oCount++;
                }
            }
            
            if xCount == self.rows {
                result = .XWin;
                break;
            } else if oCount == self.rows {
                result = .OWin;
                break;
            }
        }
        
        return result;
    }
}

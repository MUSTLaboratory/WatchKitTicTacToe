//
//  GameInterfaceController.swift
//  TicTacToe
//
//  Created by iOS Developer on 12.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit
import Foundation


class GameInterfaceController: WKInterfaceController {
    @IBOutlet var b11: WKInterfaceButton!;
    @IBOutlet var b12: WKInterfaceButton!;
    @IBOutlet var b13: WKInterfaceButton!;

    @IBOutlet var b21: WKInterfaceButton!;
    @IBOutlet var b22: WKInterfaceButton!;
    @IBOutlet var b23: WKInterfaceButton!;

    @IBOutlet var b31: WKInterfaceButton!;
    @IBOutlet var b32: WKInterfaceButton!;
    @IBOutlet var b33: WKInterfaceButton!;

    @IBOutlet var firstRowSpacer: WKInterfaceGroup!;
    @IBOutlet var secondRowSpacer: WKInterfaceGroup!;
    @IBOutlet var thirdRowSpacer: WKInterfaceGroup!;
    
    let board = Board(rows: 3, cols: 3);
    var buttons = [WKInterfaceButton]();
    
    var context: GameContext!;
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let context = context as? GameContext {
            self.context = context;
        } else {
            self.context = GameContext();
        }
        
        self.context.currentTurn = self.context.player;
        
        self.buttons.append(b11);
        self.buttons.append(b12);
        self.buttons.append(b13);
        self.buttons.append(b21);
        self.buttons.append(b22);
        self.buttons.append(b23);
        self.buttons.append(b31);
        self.buttons.append(b32);
        self.buttons.append(b33);
    }

    override func willActivate() {
        super.willActivate()
    }
    
    override func didAppear() {
        super.didAppear();
        
        self.animateWithDuration(0.25) {
            self.firstRowSpacer.setWidth(0);
        }
        
        self.animateWithDuration(0.5) {
            self.secondRowSpacer.setWidth(0);
        }
        
        self.animateWithDuration(0.75) {
            self.thirdRowSpacer.setWidth(0);
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.context;
    }
    
    //MARK: Game Logic
    
    private func handleButtonPressed(at point: Point, button: WKInterfaceButton) {
        self.markButton(at: point);
        self.check();
    }
    
    private func markButton(at point: Point) {
        if let button = self.button(at: point) {
            self.board.setState(at: point, state: (self.context.currentTurn == .X) ? Point.State.X : Point.State.O );
            button.setTitle((self.context.currentTurn == .X) ? "X" : "O");
            button.setEnabled(false);
        }
    }
    
    private func AITurn(player: GameContext.Player) {
        self.context.currentTurn = player;
        
        var point: Point?;
        
        repeat {
            //looks like a very comprehensive algorithm, isn't it? :)
            
            if self.context.level == .Hard {
                point = Point(row: rand() % 3 + 1, col: rand() % 3 + 1);
            }
            
            if self.context.level == .Normal {
                point = Point(row: rand() % 3 + 1, col: rand() % 3 + 1);
            }

            point = Point(row: rand() % 3 + 1, col: rand() % 3 + 1);
        } while (self.board.getState(at: point!) != .Empty);
        
        if let point = point {
            self.markButton(at: point);
        }

        self.check();
    }
    
    private func check() {
        let result = board.result();
        
        switch result {
        case .XWin, .OWin:
            self.context.result = result;
            self.showResults();
            break;
        default:
            self.context.turnsCount++;
            
            if self.context.turnsCount >= self.board.points() {
                self.context.result = .Draw;
                self.showResults();
            } else {
                self.context.currentTurn = (self.context.currentTurn == .X) ? GameContext.Player.O : GameContext.Player.X;
                
                if self.context.currentTurn != self.context.player {
                    self.AITurn(self.context.currentTurn);
                }
            }
            break;
        }
    }
    
    private func showResults() {
        var winner = "Nobody";
        
        switch self.context.result {
        case .XWin:
            winner = "X";
            break;
        case .OWin:
            winner = "O"
            break;
        default:
            break;
        }
        
        let actions = [
            WKAlertAction(title: "Sure thing!", style: WKAlertActionStyle.Default, handler: { self.popToRootController() })
        ];
        
        self.presentAlertControllerWithTitle("\(winner) wins!", message: "Would you like to play again?", preferredStyle: .Alert, actions: actions);
    }
    
    //MARK: Helpers
    
    private func button(at point: Point) -> WKInterfaceButton? {
        return self.buttons[(point.row - 1) * 3 + (point.col - 1)];
    }

    //MARK: Actions
    
    @IBAction
    private func b11Pressed() {
        self.handleButtonPressed(at: Point(row: 1, col: 1), button: self.b11);
    }

    @IBAction
    private func b12Pressed() {
        self.handleButtonPressed(at: Point(row: 1, col: 2), button: self.b12);
    }

    @IBAction
    private func b13Pressed() {
        self.handleButtonPressed(at: Point(row: 1, col: 3), button: self.b13);
    }

    @IBAction
    private func b21Pressed() {
        self.handleButtonPressed(at: Point(row: 2, col: 1), button: self.b21);
    }

    @IBAction
    private func b22Pressed() {
        self.handleButtonPressed(at: Point(row: 2, col: 2), button: self.b22);
    }

    @IBAction
    private func b23Pressed() {
        self.handleButtonPressed(at: Point(row: 2, col: 3), button: self.b23);
    }

    @IBAction
    private func b31Pressed() {
        self.handleButtonPressed(at: Point(row: 3, col: 1), button: self.b31);
    }

    @IBAction
    private func b32Pressed() {
        self.handleButtonPressed(at: Point(row: 3, col: 2), button: self.b32);
    }

    @IBAction
    private func b33Pressed() {
        self.handleButtonPressed(at: Point(row: 3, col: 3), button: self.b33);
    }
}

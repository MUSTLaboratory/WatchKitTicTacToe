//
//  PlayerSelectionInterfaceController.swift
//  TicTacToe
//
//  Created by iOS Developer on 13.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit
import Foundation


class PlayerSelectionInterfaceController: WKInterfaceController {

    var context: GameContext!;
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let context = context as? GameContext {
            self.context = context;
        } else {
            self.context = GameContext();
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    //MARK: Actions
    
    @IBAction
    private func chooseXPressed() {
        self.context.player = .X;
        self.pushControllerWithName("game", context: self.context);
    }

    @IBAction
    private func chooseOPressed() {
        self.context.player = .O;
        self.pushControllerWithName("game", context: self.context);
    }
}

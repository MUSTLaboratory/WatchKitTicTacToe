//
//  WelcomeInterfaceController.swift
//  TicTacToe WatchKit Extension
//
//  Created by iOS Developer on 12.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit
import Foundation


class WelcomeInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return GameContext();
    }
}

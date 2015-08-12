//
//  LevelSelectionInterfaceController.swift
//  TicTacToe WatchKit Extension
//
//  Created by iOS Developer on 12.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit
import Foundation


class LevelSelectionInterfaceController: WKInterfaceController {
    var items:[(String,String,GameContext.Level)] = [
        ("Easy","Pretty stupid",.Easy),
        ("Normal","So so",.Normal),
        ("Hard","Come get some!",.Hard)
    ]
    
    @IBOutlet var levelPicker: WKInterfacePicker!;

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
        
        let pickerItems:[WKPickerItem] = self.items.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        
        self.levelPicker.setItems(pickerItems);
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.context;
    }

    //MARK: Actions
    
    @IBAction
    private func levelPickerSelectionChanged(index: Int) {
        self.context.level = self.items[index].2;
    }
}

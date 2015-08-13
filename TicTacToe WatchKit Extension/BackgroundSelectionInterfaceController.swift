//
//  BackgroundSelectionInterfaceController.swift
//  TicTacToe
//
//  Created by iOS Developer on 13.08.15.
//  Copyright © 2015 MUST Lab. All rights reserved.
//

import WatchKit
import Foundation


class BackgroundSelectionInterfaceController: WKInterfaceController {
    var items:[(WKImage,String)] = [
        (WKImage(imageName: "bg1"),"Right choice"),
        (WKImage(imageName: "bg2"),"WTF?"),
        (WKImage(imageName: "bg3"),"Legacy")
    ]
    
    @IBOutlet var backgroundPicker: WKInterfacePicker!;
    
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
            pickerItem.contentImage = $0.0
            pickerItem.caption = $0.1
            return pickerItem
        }
        
        self.backgroundPicker.setItems(pickerItems);
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.context;
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    //MARK: Actions
    
    @IBAction
    private func backgroundPickerSelectionChanged(index: Int) {
        self.context.backgroundImage = self.items[index].0;
    }
}

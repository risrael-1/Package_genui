//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

public class SwitchUI {
    
    public init() {
        
    }
    
    @objc func switchStateDidChange(_ sender: UISwitch) {
        if (sender.isOn == true) {
                print("ON")
            } else {
                print("OFF")
            }
    }

    
    public func add(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, on: Bool, off: Bool, controller: UIViewController) -> UISwitch {
        let newSwitch = UISwitch()
        newSwitch.frame = CGRect(x: x, y: y, width: w, height: h)
        newSwitch.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        newSwitch.setOn(true, animated: false)
        return newSwitch
    }
    
    public func changeColor(switchColor: UISwitch, colorOn: UIColor, colorOff: UIColor) {
        switchColor.tintColor = colorOff
        switchColor.onTintColor = colorOn
    }
}

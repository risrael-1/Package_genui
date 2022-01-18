//
//  button.swift
//  GENUI
//
//  Created by Raphael on 18/01/2022.
//

import Foundation
import UIKit

class Button {
    func add(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, color: UIColor?, name: String, label: String) -> UIButton {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: x, y: y, width: w, height: h)
        button.backgroundColor = color ?? UIColor.black
        button.titleLabel?.text = label
        button.setTitle(name, for: UIControl.State.normal)
        button.addTarget(self, action: "Action", for: UIControl.Event.touchUpInside)
        return button
    }
}

//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

@IBDesignable public class SwitchUI: UIControl {
    
    private let switchui = UISwitch()
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    public var isSelect: Bool = false {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var switchColor: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var switchColorOff: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var switchColorOn: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var labelDescription: String = ""{
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var textColor: UIColor = .black {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable public var marginRight: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable public var marginTop: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    @IBInspectable public var marginBottom: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    @IBInspectable public var marginLeft: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable public var height: CGFloat = 200 {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable public var width: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let result = super.beginTracking(touch, with: event)
        self.isSelected.toggle()
        self.sendActions(for: .valueChanged)
        return result
    }
    
    
    private func setUp() {
        
        self.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width, height: self.frame.size.height)
        self.backgroundColor = .clear
        let backgroundSwitch = UIView.init(frame: self.frame)
        backgroundSwitch.backgroundColor = self.switchColor
        backgroundSwitch.clipsToBounds = true
        backgroundSwitch.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: self.frame.size.height)
        
        self.addSubview(backgroundSwitch)
        
        switchui.tintColor = self.switchColorOff
        switchui.onTintColor = self.switchColorOn
        
        label.text = self.labelDescription
        label.textColor = self.textColor
        label.frame = CGRect(x: 20, y: bounds.size.height / 2 - self.label.frame.size.height / 2 , width: bounds.size.width / 2, height: bounds.size.height)
        label.numberOfLines = 0
        self.addSubview(label)
        switchui.frame =  CGRect(x: self.frame.size.width - 110, y: self.frame.size.height / 2 - 20  , width: 40, height: 40)
        self.addSubview(switchui)
        
        self.superview?.addSubview(self)
    }
    
    private func refreshUI() {
        self.setUp()
    }
}

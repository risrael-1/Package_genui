//
//  StepperUI.swift
//  
//
//  Created by brs on 25/01/2022.
//

import Foundation
import UIKit



@IBDesignable public class StepperUI : UIView {
    
    private let stepper = UIStepper()
    private var label = UILabel()
    
    @IBInspectable var maxValue: Double = 0.0 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var minValue: Double = 0.0 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var value: Double = 0.0 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var textColor: UIColor = .black {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var viewColor: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var leftButtonText: String = "-" {
        didSet {
            leftButton.setTitle(leftButtonText, for: .normal)
        }
    }
    
    @IBInspectable var leftButtonTextColor: UIColor = .white {
        didSet {
            leftButton.setTitleColor(self.leftButtonTextColor, for: .normal)
            
        }
    }
    
    @IBInspectable var rightButtonTextColor: UIColor = .white{
        didSet {
            rightButton.setTitleColor(self.rightButtonTextColor, for: .normal)
        }
    }
    
    
    @IBInspectable var rightButtonText: String = "+"{
        didSet {
            rightButton.setTitle(rightButtonText, for: .normal)
        }
    }
    
    @IBInspectable var rightButtonColor: UIColor = .black{
        didSet {
            rightButton.backgroundColor = rightButtonColor
        }
    }
    
    @IBInspectable var leftButtonColor: UIColor = .black{
        didSet {
            leftButton.backgroundColor = leftButtonColor
        }
    }
    
    @IBInspectable var labelDescription: String = ""{
        didSet {
            self.refreshUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle(self.leftButtonText, for: .normal)
        button.setTitleColor(self.leftButtonTextColor, for: .normal)
        button.backgroundColor = UIColor.gray
        button.frame = CGRect(x: self.frame.size.width - 60, y: self.frame.size.height + 20  , width: 40, height: 40)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.addTarget(self, action: #selector(leftButtonValueChanged(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle(self.rightButtonText, for: .normal)
        button.setTitleColor(self.rightButtonTextColor, for: .normal)
        button.backgroundColor = UIColor.gray
        button.frame = CGRect(x: self.frame.size.width , y: self.frame.size.height + 20  , width: 40, height: 40)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(rightButtonValueChanged(_:)), for: .touchUpInside)
        return button
    }()
    
    private func setUp() {
        
        self.subviews.forEach({ subview in
           subview.removeFromSuperview()
        })
        
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width, height: self.frame.size.height)
        self.backgroundColor = .clear
        let backgroundView = UIView.init(frame: self.frame)
        backgroundView.backgroundColor = self.viewColor
        backgroundView.clipsToBounds = true
        backgroundView.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: bounds.size.height)
        
        self.addSubview(backgroundView)
        
        stepper.minimumValue = self.minValue
        stepper.maximumValue = self.maxValue
        stepper.value = self.value
        
        label.text = self.labelDescription + " \(Int(stepper.value))"
        label.textColor = self.textColor
        label.frame = CGRect(x: 20, y: bounds.size.height / 2 - self.label.frame.size.height / 2 , width: bounds.size.width / 2, height: bounds.size.height)
        label.numberOfLines = 0
        leftButton.frame = CGRect(x: self.frame.size.width - 110, y: self.frame.size.height / 2 - 20  , width: 40, height: 40)
        rightButton.frame = CGRect(x: self.frame.size.width - 60, y: self.frame.size.height / 2 - 20  , width: 40, height: 40)
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        self.addSubview(label)
        
        self.superview?.addSubview(self)
    }
    
    private func refreshUI() {
        self.setUp()
    }
    
    @objc func rightButtonValueChanged(_ sender: UIButton) {
        
        self.stepper.value += 1
        label.text = self.labelDescription + " \(Int(self.stepper.value))"
        
    }
    
    @objc func leftButtonValueChanged(_ sender: UIButton) {
        
        self.stepper.value -= 1
        label.text = self.labelDescription + " \(Int(self.stepper.value))"
        
    }
    
}

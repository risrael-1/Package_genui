//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

@IBDesignable public class SliderUI: UIView {
    
    private let slider = UISlider()
    private var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    @IBInspectable var minValue: Float = 0.0 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var maxValue: Float = 0.0 {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var labelDescription: String = ""{
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var sliderColor: UIColor = .white {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var textColor: UIColor = .black {
        didSet {
            self.refreshUI()
        }
    }
    
    @IBInspectable var marginRight: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable var marginTop: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    @IBInspectable var marginBottom: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    @IBInspectable var marginLeft: CGFloat = 0 {
        didSet {
            setUp()
        }
    }

    @IBInspectable var height: CGFloat = 200 {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable var width: CGFloat = 0 {
        didSet {
            setUp()
        }
    }
    
    private func setUp() {
            
        self.subviews.forEach({ subview in
           subview.removeFromSuperview()
        })
        
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.size.width, height: self.frame.size.height)
        self.backgroundColor = .clear
        let backgroundSlider = UIView.init(frame: self.frame)
        backgroundSlider.backgroundColor = self.sliderColor
        backgroundSlider.clipsToBounds = true
        backgroundSlider.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: bounds.size.height)
        
        self.addSubview(backgroundSlider)
        
        
        slider.minimumValue = self.minValue
        slider.maximumValue = self.maxValue
        
        label.text = self.labelDescription
        label.textColor = self.textColor
        label.frame = CGRect(x: 20, y: bounds.size.height / 2 - self.label.frame.size.height / 2 , width: bounds.size.width / 2, height: bounds.size.height)
        label.numberOfLines = 0
        self.addSubview(label)
        
        slider.frame = self.frame
        
        self.superview?.addSubview(self)
    }
    
    private func refreshUI() {
        self.setUp()
    }
}

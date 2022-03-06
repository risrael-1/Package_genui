//
//  ViewUI.swift
//  
//
//  Created by brs on 25/01/2022.
//

import Foundation
import UIKit


@IBDesignable public class ViewUI : UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable public var cornerRadiusTopRight: Bool = false {
        didSet {
            setUp()
        }
    }

    @IBInspectable public var cornerRadiusBottomRight: Bool = false {
        didSet {
            setUp()
        }
    }
    @IBInspectable public var cornerRadiusTopLeft: Bool = false {
        didSet {
            setUp()
        }
    }
    @IBInspectable public var cornerRadiusBottomLeft: Bool = false {
        didSet {
            setUp()
        }
    }
    
    @IBInspectable public var startColor: UIColor = UIColor.black {
        didSet {
           setUp()

        }
    }
    
    @IBInspectable public var endColor: UIColor = UIColor.black {
        didSet {
            setUp()
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
    
    @IBInspectable public var radiusCorner: CGFloat = 0 {
        didSet {
            setUp()
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
    
    private func setUp(){
        
        self.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        
        
        self.setUpSizeView()
        self.clipsToBounds = true
        
        layer.cornerRadius = radiusCorner
        layer.maskedCorners = self.addRoundedCorner()
        
        
        setGradient(topGradientColor: self.startColor, bottomGradientColor: self.endColor)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setContentHuggingPriority(.init(rawValue: 0), for: .vertical)
    }
    
    private func setUpSizeView() {
        if self.width <= 0 {
            self.frame = CGRect(x: marginLeft, y: marginTop, width: UIScreen.main.bounds.width  - ( marginRight + marginLeft), height: self.height - (marginBottom +  marginTop))
        } else {
         
            self.frame = CGRect(x: marginLeft, y: marginTop, width: self.width - (marginRight + marginLeft), height: self.height - (marginBottom +  marginTop))
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
           
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.cornerRadius = self.radiusCorner
            gradientLayer.maskedCorners = self.addRoundedCorner()
            gradientLayer.locations = [0, 1]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
            
            
            
           if self.width <= 0 {
               gradientLayer.frame = CGRect(x: marginLeft, y: marginRight, width: UIScreen.main.bounds.width  - ( marginRight + marginLeft), height:  self.height - (marginBottom +  marginTop))
           
                
            } else {
                gradientLayer.frame = CGRect(x: marginLeft, y: marginRight, width: self.width - (marginRight + marginLeft), height:  self.height - (marginBottom +  marginTop))
                gradientLayer.frame = layer.bounds
            }
            layer.insertSublayer(gradientLayer, at: 0)
            
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
    private func addRoundedCorner() -> CACornerMask{
        
        var corners: CACornerMask = []
        if(self.cornerRadiusTopLeft){
            corners.insert(CACornerMask.layerMinXMinYCorner)
        }
        if (self.cornerRadiusTopRight){
            corners.insert(CACornerMask.layerMaxXMinYCorner)
        }
        if (self.cornerRadiusBottomLeft){
            corners.insert(CACornerMask.layerMinXMaxYCorner)
        }
        if (self.cornerRadiusBottomRight){
            corners.insert(CACornerMask.layerMaxXMaxYCorner)
        }
        return corners
    }
    
}

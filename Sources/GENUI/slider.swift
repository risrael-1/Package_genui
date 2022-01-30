//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

public class SliderUI {
    
    public init() {
        
    }
    
    public func add(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, minimim: Float, maximum: Float) -> UISlider {
        let slider = UISlider()
        slider.frame = CGRect(x: x, y: y, width: w, height: h)
        slider.minimumValue = minimim
        slider.maximumValue = maximum
        return slider
    }
    
    public func addValue(label: UILabel, slider: UISlider) {
        label.text = "\(slider.value)"
    }
}

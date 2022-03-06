//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

@IBDesignable public class CheckBox: UIControl {
    
    private let imageView = UIImageView()
    
    public var isChecked: Bool = false {
        didSet {
            self.updateCheckedStateUI()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialSetup()
    }
    
    @IBInspectable public
    var isImageFill: Bool = false {
        didSet {
            initialSetup()
        }
    }
    
    @IBInspectable public
    var colorCheck: UIColor  = UIColor.white {
        didSet {
            initialSetup()
        }
    }
    
    @IBInspectable public
    var colorUnCheck: UIColor  = UIColor.white {
        didSet {
            initialSetup()
        }
    }
    
    private func initialSetup() {
        self.backgroundColor = .clear
        self.tintColor = self.colorUnCheck
        self.imageView.contentMode = .center
        self.imageView.isUserInteractionEnabled = false
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.imageView)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.updateCheckedStateUI()
    }
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let result = super.beginTracking(touch, with: event)
        self.isChecked.toggle()
        self.sendActions(for: .valueChanged)
        return result
    }
    
    private func updateCheckedStateUI() {
        if #available(iOS 13.0, *) {
            let conf = UIImage.SymbolConfiguration(weight: .bold).applying(UIImage.SymbolConfiguration(scale: .large))
            
            if self.isChecked {
                if self.isImageFill {
                    self.imageView.image = UIImage(systemName: "checkmark.square.fill", withConfiguration: conf)
                } else {
                    self.imageView.image = UIImage(systemName: "checkmark.square", withConfiguration: conf)
                }
                self.imageView.tintColor = self.colorCheck
            } else {
                self.imageView.image = UIImage(systemName: "square", withConfiguration: conf)
                self.imageView.tintColor = self.colorUnCheck
            }
        }
    }
}

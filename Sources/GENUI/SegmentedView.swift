//
//  File.swift
//  
//
//  Created by brs on 05/03/2022.
//

import Foundation
import UIKit

public class SegmentedView: UIView {
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundView: UIView!

    weak var delegate: SegmentedViewButtonDelegate?

    @objc func configure(with rightButtonImage: UIImage?) {
        self.rightButton.isHidden = true
        if let rightButtonImage = rightButtonImage {
            self.rightButton.setImage(rightButtonImage, for: .normal)
        } else {
            self.leadingConstraint.constant = 10
            self.trailingConstraint.constant = 10
        }
    }

    func configure(with color: UIColor) {
        if #available(iOS 13.0, *) {
            self.segmentedControl.backgroundColor = color
            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .selected)
        } else {
            self.segmentedControl.tintColor = color
        }
    }
    
    func configureWhite(with color: UIColor) {
        if #available(iOS 13.0, *) {
            self.segmentedControl.backgroundColor = color
            self.segmentedControl.selectedSegmentTintColor = .white
            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
                UIColor.white], for: .normal)
            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .selected)
        } else {
            self.segmentedControl.tintColor = color
        }
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        self.backgroundView.backgroundColor = color
    }

    @IBAction func rightButtonAction(_ sender: Any) {
        self.delegate?.didPressRightButton(sender: self)
    }
}

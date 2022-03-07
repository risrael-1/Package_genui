//
//  File.swift
//  
//
//  Created by brs on 05/03/2022.
//

import Foundation
import UIKit

extension UIViewController {
    public func addFullScreenChildViewController(_ child: UIViewController, in subView: UIView, animated: Bool = false) -> (() -> Void) {
        let parentView = subView
        let shouldManualyForward = self.shouldAutomaticallyForwardAppearanceMethods
        if let detailsView = child.view {
            detailsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addChild(child)
            detailsView.frame = parentView.bounds
            parentView.addSubview(detailsView)
            
            if shouldManualyForward {
                self.addChild(child)
                child.beginAppearanceTransition(true, animated: animated)
                detailsView.layoutIfNeeded()
            }
        }
        
        let result: (() -> Void) = {
            child.didMove(toParent: self)
            if shouldManualyForward {
                child.endAppearanceTransition()
            }
        }
        return result
    }
    
}

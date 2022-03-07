//
//  File.swift
//  
//
//  Created by brs on 05/03/2022.
//

import Foundation
import UIKit

protocol SegmentedViewButtonDelegate: AnyObject {
    func didPressRightButton(sender: AnyObject)
}

public class SegmentedViewController: UIViewController, SegmentedViewButtonDelegate {

    public enum Mode {
        case standAlone(color: UIColor)
        case standAloneWhite(color: UIColor)
    }

    weak var segmentedViewButtonDelegate: SegmentedViewButtonDelegate?

    public var mode = Mode.standAlone(color: UIColor.red) {
        willSet {
            if self.isViewLoaded {
                fatalError("mode cannot be changed after view load")
            }
        }
    }
    
    public var backgroundColor: UIColor = .white

    @objc  public var viewControllers: [UIViewController] = [] {
        didSet {
            if self.isViewLoaded {
                self.setupSegmentedControl()
            }
        }
    }

    private var selectedViewController: UIViewController?

    private var segmentedView: SegmentedView!

    private var segmentedControl: UISegmentedControl {
        switch self.mode {
        case .standAlone, .standAloneWhite:
            guard let segmentedView = self.view as? SegmentedView else {
                fatalError("couldn't convert view to a SegmentedView")
            }
            return segmentedView.segmentedControl
        }
    }
    private var contentView: UIView {
        assert(self.isViewLoaded)
        switch self.mode {
        case .standAlone, .standAloneWhite:
            guard let segmentedView = self.view as? SegmentedView else {
                fatalError("couldn't convert view to a SegmentedView")
            }
            return segmentedView.contentView
        }
    }

    public override func loadView() {
        switch self.mode {
        case .standAlone(let color):
            super.loadView()
            guard let segmentedView = UINib(nibName: "SegmentedView", bundle: nil).instantiate(withOwner: self).first as? SegmentedView else {
                    fatalError("couldn't convert UINib to a SegmentedView")
            }
            segmentedView.configure(with: nil)
            segmentedView.configure(with: color)
            segmentedView.delegate = self
            segmentedView.changeBackgroundColor(self.backgroundColor)
            self.view = segmentedView
        case .standAloneWhite(let color):
            super.loadView()
            guard let segmentedView = UINib(nibName: "SegmentedView", bundle: nil).instantiate(withOwner: self).first as? SegmentedView else {
                    fatalError("couldn't convert UINib to a SegmentedView")
            }
            segmentedView.configure(with: nil)
            segmentedView.configureWhite(with: color)
            segmentedView.delegate = self
            segmentedView.changeBackgroundColor(self.backgroundColor)
            self.view = segmentedView
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSegmentedControl()
        if !self.viewControllers.isEmpty {
            self.setSelectedViewController(at: 0)
            self.segmentedControl.selectedSegmentIndex = 0
        }
        self.segmentedControl.addTarget(self, action: #selector(self.selectionChanged), for: .valueChanged)
    }
    @objc func selectionChanged(sender: UISegmentedControl) {
        if (sender.numberOfSegments - 1) == sender.selectedSegmentIndex {
            self.segmentedView?.rightButton.isHidden = false
        } else {
            self.segmentedView?.rightButton.isHidden = true
        }
        self.setSelectedViewController(at: sender.selectedSegmentIndex)
    }
    @objc public func setSelectedViewController(at index: Int) {
        self.segmentedControl.selectedSegmentIndex = index
        let selected = self.viewControllers[index]
        if let oldSelected = self.selectedViewController {
            if oldSelected === selected {
                return
            } else {
                //let animationEnd = oldSelected.removeFullScreenChildFromParentViewController(animated: false)
                //animationEnd()
            }
        }
        let animationStart = self.addFullScreenChildViewController(selected, in: self.contentView)
        animationStart()
        self.selectedViewController = selected
    }

    @objc func setupSegmentedControl() {
        switch self.mode {
        case .standAlone(let color):
            self.segmentedControl.tintColor = color
        case .standAloneWhite:
            self.segmentedControl.tintColor = .white
        }

        self.segmentedControl.removeAllSegments()
        for (index, viewController) in self.viewControllers.enumerated() {
            self.segmentedControl.insertSegment(withTitle: viewController.title, at: index, animated: false)
        }
        if let selectedViewController = self.selectedViewController,
            let index = self.viewControllers.firstIndex(where: {$0 === selectedViewController}) {
            self.segmentedControl.selectedSegmentIndex = index
        }
    }

    @objc func didPressRightButton(sender: AnyObject) {
        self.segmentedViewButtonDelegate?.didPressRightButton(sender: sender)
    }
}

//
//  slider.swift
//  GENUI
//
//  Created by Raphael on 30/01/2022.
//

import Foundation
import UIKit

public class SearchBarUI {
    
    public init() {
        
    }
    
    public func add(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, placeholer: String?) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: x, y: y, width: w, height: h)
        searchBar.placeholder = placeholer ?? ""
        return searchBar
    }
}

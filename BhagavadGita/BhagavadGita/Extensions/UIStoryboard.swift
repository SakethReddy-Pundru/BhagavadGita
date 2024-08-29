//
//  UIStoryboard.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation
import UIKit

// MARK: - UIStoryboard Extension

/// Extension for UIStoryboard to provide convenience initializers and properties.
extension UIStoryboard {
    
    // MARK: - Initializers
    
    /// Convenience initializer that initializes a storyboard with the given name and no bundle.
    /// - Parameter name: The name of the storyboard file.
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
    
    // MARK: - Static Properties
    
    /// A static property that returns the main storyboard of the application.
    /// - Returns: The UIStoryboard instance for the "Main" storyboard.
    static var main: UIStoryboard { return UIStoryboard(name: "Main") }
}

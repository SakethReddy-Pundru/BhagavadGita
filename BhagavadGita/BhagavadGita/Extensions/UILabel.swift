//
//  UILabel.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 28/08/24.
//

import Foundation
import UIKit

// MARK: - UILabel Extension

/// Extension for UILabel to add a customizable line spacing property.
extension UILabel {
    
    // MARK: - Line Spacing Property
    
    /// A computed property to set the line spacing of the label's text.
    /// - Note: The getter always returns `0` since it is not feasible to retrieve the current line spacing from a UILabel's attributed text.
    var spacing: CGFloat {
        get {return 0}  // Getter is set to return 0, as UILabel does not provide a way to get the current line spacing
        set {
            let textAlignment = self.textAlignment
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = newValue
            let attributedString = NSAttributedString(string: self.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
            self.attributedText = attributedString
            self.textAlignment = textAlignment
        }
    }
}

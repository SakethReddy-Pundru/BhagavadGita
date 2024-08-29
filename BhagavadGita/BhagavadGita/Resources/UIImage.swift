//
//  UIImage.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation
import UIKit

// MARK: - ImageLiteral Enum

/// An enum representing image literals used in the app.
enum ImageLiteral: String {
    case krishna = "Krishna"
    case backButtonImage = "Back"
    
    // MARK: - Properties
    
    /// A computed property to retrieve the UIImage for the enum case.
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

// MARK: - UIImage Extension

/// An extension to UIImage to add additional functionalities.
extension UIImage {
    
    // MARK: - Methods
    
    /// Resizes the image to the specified size.
    /// - Parameter size: The target size for resizing the image.
    /// - Returns: A new UIImage object that is resized to the specified size.
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

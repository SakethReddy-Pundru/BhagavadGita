//
//  UIViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 27/08/24.
//

import Foundation
import UIKit

// MARK: - UIViewController Extension

/// Extension for UIViewController to provide utility functions for styling and showing alerts.
extension UIViewController {
    
    // MARK: - Button Styling
    
    /// Applies rounded corners and shadow to a UIButton.
    /// - Parameter customButton: The UIButton to style.
    func applyCornerAndShadowToButton(customButton: UIButton) {
        // Apply rounded corners
        customButton.layer.cornerRadius = 12
        customButton.layer.masksToBounds = true
        
        // Apply shadow
        customButton.layer.shadowColor = Colors.navBar?.cgColor
        customButton.layer.shadowOpacity = 0.5
        customButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        customButton.layer.shadowRadius = 5
        customButton.layer.masksToBounds = false // Important to keep the shadow visible
        
        // Optional: Improve shadow performance
        customButton.layer.shouldRasterize = true
        customButton.layer.rasterizationScale = UIScreen.main.scale
    }
    
    // MARK: - View Styling
    
    /// Applies corner radius and shadow to a UIView.
    /// - Parameter view: The UIView to style.
    func applyCornerAndShadowToView(view: UIView) {
        // Apply corner radius
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = false
        
        // Apply shadow
        view.layer.shadowColor = Colors.navBar?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 3
    }
    
    // MARK: - Alert Presentation
    
    /// Presents an alert on the specified view controller with a title and message.
    /// - Parameters:
    ///   - viewController: The view controller to present the alert on.
    ///   - title: The title of the alert.
    ///   - message: The message of the alert.
    func showAlert(on viewController: UIViewController, title: String, message: String) {
        // Create an alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add a default action (button)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK button tapped")
        }
        alertController.addAction(okAction)
        
        // Present the alert controller
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Create Paragraph Style
    
    func applyParagraphStyleToLongText(text: String) -> NSMutableAttributedString {
        // Create a NSMutableParagraphStyle for line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8.0 // Adjust this value for desired spacing
        paragraphStyle.alignment = .justified   // Justify the text
        
        // Define the font attributes
        let font = UIFont(name: "Verdana", size: 14)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .paragraphStyle: paragraphStyle
        ]
        
        // Create an attributed string with the paragraph style
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
    func showBackButton() {
        let backButn = UIButton.init(frame: CGRect(x:0,y:0,width:25,height:25))
        backButn.setImage(ImageLiteral.backButtonImage.image, for: UIControl.State.normal)
        backButn.addTarget(self, action: #selector(backBtnTapped(sender:)), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem.init(customView: backButn)
        self.navigationItem.leftBarButtonItems = [backButtonItem]
    }
    
    @objc public func backBtnTapped(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

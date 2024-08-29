//
//  LoaderHandling.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 28/08/24.
//

import Foundation
import UIKit

//  in protocol extension, cannot modify properties unless the protocol is restricted to classes (using class or AnyObject), which allows self to be mutable.


// MARK: - LoaderHandling Protocol

/// A protocol for handling the display of a loader in view controllers.
/// Restricts conforming types to classes, allowing mutability of `self`.
protocol LoaderHandling: AnyObject {    // Restrict to class types
    
    var loader: Loader? { get set } /// A loader instance to manage loading indicators.
    func showLoader()       /// Shows the loading indicator.
    func stopLoader()   /// Hides the loading indicator.
    
    /// Sets up the loader with the specified view.
    /// - Parameter view: The view in which the loader should be displayed.
    func setupLoader(for view: UIView)
}

// MARK: - LoaderHandling Default Implementations

/// Default implementations for the LoaderHandling protocol.
extension LoaderHandling {
    
    /// Initializes and assigns a loader to the provided view.
    /// - Parameter view: The view in which the loader should be displayed.
    func setupLoader(for view: UIView) {
        loader = Loader(view: view)
    }
    
    /// Starts the loader animation, showing the loading indicator.
    func showLoader() {
        loader?.startLoader()
    }
    
    /// Stops the loader animation, hiding the loading indicator.
    func stopLoader() {
        loader?.stopLoader()
    }
}

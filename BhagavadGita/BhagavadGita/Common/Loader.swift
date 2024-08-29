//
//  Loader.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import Foundation
import UIKit

// MARK: - Loader Class

/// A utility class for displaying and managing a loading indicator (spinner)
/// in a specified view. The loader is typically used to indicate that an operation
/// is in progress, preventing user interaction with the view until the operation completes.
class Loader {
    
    // MARK: - Properties
    
    /// The activity indicator used to display the loading spinner.
    private var activityIndicator: UIActivityIndicatorView
    
    /// The view in which the loading spinner is displayed.
    /// This is a weak reference to avoid retain cycles.
    private weak var view: UIView?
    
    // MARK: - Initializer
    
    /// Initializes the loader with the specified view.
    /// - Parameter view: The view in which the loading spinner should be displayed.
    init(view: UIView) {
        self.view = view
        activityIndicator = UIActivityIndicatorView(style: .large)
        setupActivityIndicator()
    }
    
    // MARK: - Private Methods
    
    /// Sets up the activity indicator by positioning it at the center of the view
    /// and configuring its appearance.
    private func setupActivityIndicator() {
        guard let view = view else { return }
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    // MARK: - Public Methods
    
    /// Starts the loading spinner and disables user interaction with the view.
    func startLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.view?.isUserInteractionEnabled = false
        }
    }
    
    /// Stops the loading spinner and re-enables user interaction with the view.
    func stopLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.view?.isUserInteractionEnabled = true
        }
    }
}

//
//  TabBarViewController.swift
//  BhagavadGita
//
//  Created by Saketh Reddy on 26/08/24.
//

import UIKit


// MARK: - UITabBarController

/// A custom UITabBarController to manage tabs and configure appearance.
class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureTabs()
    }
    
    // MARK: - Properties
    
    /// Lazy-loaded home tab bar with a custom navigation controller and tab bar item.
    lazy public var homeTabBar: UINavigationController = {
        guard let homeVC = UIStoryboard
            .main.instantiateViewController(withIdentifier: "HomeViewController")
                as? HomeViewController else { return UINavigationController() }
        let navigationController = UINavigationController(rootViewController: homeVC)
        let title = "Chapters"
        let originalImage = ImageLiteral.krishna.image
        let resizedImage = originalImage?.resized(to: CGSize(width: 100, height: 100))
        let tabBarItem = UITabBarItem(title: title, image: resizedImage?.withRenderingMode(.alwaysOriginal), tag: 0)
        navigationController.tabBarItem = tabBarItem
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: 15, right: 0)
        return navigationController
    }()
    
    // MARK: - Configuration
    
    /// Configures the appearance and behavior of the tab bar.
    private func configureTabs() {
        self.viewControllers = [homeTabBar]
        
        // Customize tab bar appearance
        tabBar.isTranslucent = true
        tabBar.backgroundImage = UIImage() // Remove default background
        tabBar.shadowImage = UIImage() // Remove the shadow line
        
        // Set the tab bar background to be transparent
        tabBar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        // Optionally, customize the tint color (the color of the selected icon and text)
        tabBar.tintColor = .clear
    }
    
    // MARK: - UITabBarControllerDelegate
    
    /// Resets the navigation stack when the tab bar item is selected.
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let viewControllers = self.viewControllers,
              let index = viewControllers.firstIndex(where: { $0.tabBarItem == item }),
              index == selectedIndex else {
            return
        }
        
        if let navController = viewControllers[selectedIndex] as? UINavigationController {
            DispatchQueue.main.async {
                navController.popToRootViewController(animated: true)
            }
        }
    }
}

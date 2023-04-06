//
//  TabbarController.swift
//  Testing
//
//  Created by Ahmad Nur Alifullah on 07/04/23.
//

import UIKit

class TabbarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Helpers
  private func setupViews() {
    tabBar.tintColor = .black
    tabBar.unselectedItemTintColor = .lightGray
    
    let homeNavigationController = UINavigationController(rootViewController: MainViewController())
    homeNavigationController.title = "Gamelog"
    homeNavigationController.tabBarItem.image = UIImage(named: "tabHomeUnselected")
    homeNavigationController.tabBarItem.selectedImage = UIImage(named: "tabHome")
    
    let searchNavigationController = UINavigationController(rootViewController: MainViewController())
    searchNavigationController.title = "Search"
    searchNavigationController.tabBarItem.image = UIImage(named: "tabSearchUnselected")
    searchNavigationController.tabBarItem.selectedImage = UIImage(named: "tabSearch")
    
    let favoriteNavigationController = UINavigationController(rootViewController: MainViewController())
    favoriteNavigationController.title = "Favorite"
    favoriteNavigationController.tabBarItem.image = UIImage(named: "tabFavoriteUnselected")
    favoriteNavigationController.tabBarItem.selectedImage = UIImage(named: "tabFavorite")
    
    let aboutNavigationController = UINavigationController(rootViewController: MainViewController())
    aboutNavigationController.title = "About"
    aboutNavigationController.tabBarItem.image = UIImage(named: "tabAboutUnselected")
    aboutNavigationController.tabBarItem.selectedImage = UIImage(named: "tabAbout")
    
    viewControllers = [
      homeNavigationController,
      searchNavigationController,
      favoriteNavigationController,
      aboutNavigationController
    ]
  }
}

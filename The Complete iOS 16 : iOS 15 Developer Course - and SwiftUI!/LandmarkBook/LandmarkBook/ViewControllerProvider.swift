//
//  ViewControllerProvider.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 9/11/23.
//

import UIKit

protocol ViewControllerProviding {
    func detailsViewController() -> DetailsViewController
    func viewController() -> ViewController
    func buttonViewController() -> ButtonViewController
}

class ViewControllerProvider: ViewControllerProviding {
    static let shared = ViewControllerProvider()  // Singleton instance
    
    private init() {}

    func detailsViewController() -> DetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        return viewController
    }
    
    func viewController() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return viewController as ViewController
    }
    
    func buttonViewController() -> ButtonViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
        return viewController as ButtonViewController
    }
}

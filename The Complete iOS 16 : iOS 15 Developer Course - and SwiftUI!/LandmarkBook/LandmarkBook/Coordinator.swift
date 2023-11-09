//
//  Coordinator.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 9/11/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    
    func startCoordinator()
}

class MainCoordinator: Coordinator{
    var childCoordinator: [Coordinator] = []
    
    var navigationController = UINavigationController()
    
    func startCoordinator() {
        let initialViewController = ViewControllerProvider.shared.viewController()
        initialViewController.mainCoordinator = self
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    func showDetailsOf(landmarkName: String, landmarkImage: UIImage) {
        let detailsViewController = ViewControllerProvider.shared.detailsViewController()
        detailsViewController.mainCoordinator = self
        detailsViewController.selectedLandmarkName = landmarkName
        detailsViewController.selectedLandmarkImage = landmarkImage
        navigationController.pushViewController(detailsViewController, animated: true)

    }
    
    func showButton() {
        let buttonViewController = ViewControllerProvider.shared.buttonViewController()
        buttonViewController.mainCoordinator = self
        navigationController.pushViewController(buttonViewController, animated: true)

    }
    
}

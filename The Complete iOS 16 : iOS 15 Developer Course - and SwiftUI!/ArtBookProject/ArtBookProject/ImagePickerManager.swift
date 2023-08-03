//
//  ImagePickerManager.swift
//  ArtBookProject
//
//  Created by Patricio Calderon on 1/08/23.
//

import Foundation
import UIKit
import PhotosUI

class ImagePickerManager: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {

var picker: PHPickerViewController?
var pickImageCallback : ((UIImage) -> ())?
var viewController: UIViewController?

override init(){
    super.init()
}

func pickSingleImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
    pickImageCallback = callback
    self.viewController = viewController
    
    var configuration = PHPickerConfiguration()
    configuration.filter = .any(of: [.images, .livePhotos])
    configuration.selectionLimit = 1
    picker = PHPickerViewController(configuration: configuration)
    picker?.delegate = self
    viewController.present(picker!, animated: true, completion: nil)
}

func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    picker.dismiss(animated: true) {
        let itemProviders = results.map(\.itemProvider)
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        if let image = image as? UIImage {
                            self.pickImageCallback!(image)
                        }
                    }
                }
            }
        }
    }
  }
}

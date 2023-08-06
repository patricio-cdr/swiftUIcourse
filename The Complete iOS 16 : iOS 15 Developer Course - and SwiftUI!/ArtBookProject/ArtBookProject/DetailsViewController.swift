//
//  DetailsViewController.swift
//  ArtBookProject
//
//  Created by Patricio Calderon on 13/07/23.
//

import UIKit
import PhotosUI
import CoreData

class DetailsViewController: UIViewController, PHPickerViewControllerDelegate {
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    // Class variables
    private var selection = [String: PHPickerResult]()
    private var selectedAssetIdentifiers = [String]()
    private var selectedAssetIdentifierIterator: IndexingIterator<[String]>?
    private var currentAssetIdentifier: String?
    
    
    @objc func presentPicker() {
        
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        //config.selection = .ordered


        let pickerViewController = PHPickerViewController(configuration: config)
        pickerViewController.delegate = self
        self.present(pickerViewController, animated: true, completion: nil)
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let existingSelection = self.selection
        var newSelection = [String: PHPickerResult]()
        for result in results {
            let identifier = result.assetIdentifier!
            newSelection[identifier] = existingSelection[identifier] ?? result
        }
        
        // Track the selection in case the user deselects it later.
        selection = newSelection
        selectedAssetIdentifiers = results.map(\.assetIdentifier!)
        selectedAssetIdentifierIterator = selectedAssetIdentifiers.makeIterator()
        
        if selection.isEmpty {
            displayEmptyImage()
        } else {
            displayNext()
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            // User clicked on painting from list
            // Core data
            
            saveButton.isHidden = true
            saveButton.isEnabled = true
            
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            self.nameTextField.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            self.artistTextField.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            self.yearTextField.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                        
                }
                
            } catch {
                print("Error")
            }
            
            
        } else {
            // User clicked on plus button
            
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            nameTextField.text = ""
            artistTextField.text = ""
            yearTextField.text = ""
        }

        // Recognizers
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        self.imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        // Attributes
        
        newPainting.setValue(nameTextField.text!, forKey: "name")
        newPainting.setValue(artistTextField.text!, forKey: "artist")
        
        if let year = Int(yearTextField.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        self.navigationController?.popViewController(animated: true )
        
    }
    
    
    
    

}

private extension DetailsViewController {
    
    /// - Tag: LoadItemProvider
    func displayNext() {
        guard let assetIdentifier = selectedAssetIdentifierIterator?.next() else { return }
        currentAssetIdentifier = assetIdentifier
        
        let progress: Progress?
        let itemProvider = selection[assetIdentifier]!.itemProvider
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            progress = itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    self?.handleCompletion(assetIdentifier: assetIdentifier, object: image, error: error)
                }
            }
        } else {
            progress = nil
        }
        
        //displayProgress(progress)
    }
    
    func handleCompletion(assetIdentifier: String, object: Any?, error: Error? = nil) {
        
        saveButton.isEnabled = true
        
        guard currentAssetIdentifier == assetIdentifier else { return }
        if let image = object as? UIImage {
            displayImage(image)
        } else if let error = error {
            print("Couldn't display \(assetIdentifier) with error: \(error)")
            displayErrorImage()
        } else {
            displayUnknownImage()
        }
    }
    
}


private extension DetailsViewController {
    
    func displayEmptyImage() {
        displayImage(UIImage(systemName: "photo.on.rectangle.angled"))
    }
    func displayErrorImage() {
        displayImage(UIImage(systemName: "exclamationmark.circle"))
    }
    
    func displayUnknownImage() {
        displayImage(UIImage(systemName: "questionmark.circle"))
    }
    
    func displayImage(_ image: UIImage?) {
        imageView.image = image
    }
}

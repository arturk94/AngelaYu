//
//  ViewController.swift
//  WhatFlower
//
//  Created by Artur KNOTHE on 21/11/2020.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

struct WikipediaRequest: Encodable {
    let format : String
    let action : String
    let prop : String
    let exintro : String
    let explaintext : String
    let titles : String
    let indexpageids : String
    let redirects : String
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var imagePicker = UIImagePickerController()
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert image to CIImage")
            }
            
            //pickedImage = ciImage
            
            detect(flowerImage: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(flowerImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loadiing CoreML Model Faled")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image")
            }
            
            if let firstResult = classification.first {
                self.navigationItem.title = firstResult.identifier

                self.requestInfo(flowerName: firstResult.identifier)
                
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: flowerImage)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
        
    }
    
    func requestInfo(flowerName: String) {
        
        let parameters = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "500"
        ]
        
        AF.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
                case .success:
                    print("Go to Wikipedia info")
                    print(response)
                    
                    let flowerJSON : JSON = JSON(response.value)
                    let pageid = flowerJSON["query"]["pageids"][0].stringValue
                    let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].string
                    
                    let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                    
                    self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                    self.label.text = flowerDescription
                    
                case .failure:
                    print("Failed to go to Wikipedia info")
            }
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}


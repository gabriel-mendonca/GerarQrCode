//
//  ViewController.swift
//  GerarQrCode
//
//  Created by Gabriel Mendonça on 23/03/20.
//  Copyright © 2020 Gabriel Mendonça. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func performButtonAction(sender: AnyObject) {
        if let myString = textField.text {
                   
                   imageView.image = generateQRCode(from: textField.text!)
                   
               }else {
                   imageView.image = generateQRCode(from: "")
               }
    }
        func generateQRCode(from string:String) -> UIImage? {
            
            let data = string.data(using: String.Encoding.ascii)
            
            if let filter = CIFilter(name: "CIQRCodeGenerator"){
                
                filter.setValue(data, forKey: "inputMessage")
                
                let transform = CGAffineTransform(scaleX: 3, y: 3)
                
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
                
            }
            return nil
    }


}


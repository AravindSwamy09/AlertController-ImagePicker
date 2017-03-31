//
//  ViewController.swift
//  AlertController
//
//  Created by ESS Mac Pro on 3/31/17.
//  Copyright © 2017 NGA Group Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Actnalert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Register", message: "Enter your name.", preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Enter name"
        }
        let ok = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            
            if let textField = alert.textFields?.first{
                if textField.text == ""{
                 print("Enter your name please!")
                }else{
                    print("Hello \(textField.text!)")
                }
            }
        }
        alert.addAction(ok)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default){(action:UIAlertAction) in
            
        })
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func actionSheet(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let alertSheet = UIAlertController(title: "Image Source", message: "Choose camera or your Photo library", preferredStyle: .actionSheet)
        alertSheet.addAction(UIAlertAction(title: "Camera", style: .default){(action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
                self.present(picker, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Message", message: "Camera is not available.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
        alertSheet.addAction(UIAlertAction(title: "Photo Library", style: .default){(action:UIAlertAction) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        })
        alertSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


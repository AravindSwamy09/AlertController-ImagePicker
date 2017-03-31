//
//  ViewController.swift
//  AlertController
//
//  Created by ESS Mac Pro on 3/31/17.
//  Copyright © 2017 NGA Group Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        let alertSheet = UIAlertController(title: "Image Source", message: "Choose camera or your Photo library", preferredStyle: .actionSheet)
        alertSheet.addAction(UIAlertAction(title: "Camera", style: .default))
        alertSheet.addAction(UIAlertAction(title: "Photo Library", style: .default))
        alertSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertSheet, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


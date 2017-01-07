//
//  ResetPasswordViewController.swift
//  FireBaseTutorial1
//
//  Created by Jason Shepherd on 1/5/17.
//  Copyright © 2017 Jason Shepherd. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @ IBAction func resetPassword(sender: AnyObject) {
        if self.emailTextField.text == " " {
            let alertController = UIAlertController(title: "You Forgot", message: "Please enter an email", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
                var  title = " "
                var  message = " "
                
                if error != nil {
                    title = "Error"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Successful"
                    message = " Please check your email"
                    self.emailTextField.text = ""
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            })
        }
        
    }
}

//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//


import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//                guard let strongSelf = self else { return } // This is little bit of code that firebase has actually left in here which is actually slightly outdated. The latest syntax is strongSelf -> self.
                // What it does -> It avoids a retained cycle in the cases where we're actually referring to the VC within our closure & we're going to be destroying this VC before this closure completes.
                // Here we really don't need that -> 1. [weak self] & 2. guard let strongSelf = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                }else{
                    // Naviagate to chat vc.
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
        
    }
    
}

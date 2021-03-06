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
    

    //MARK:- ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName+" Login"
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print("This is error : \(e.localizedDescription)")
                }else{
                    // Naviagate to chat vc.loginSegue
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
        
    }
    
}

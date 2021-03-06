//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK:- ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName+" SignUp!"
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription) // Give the error message which is understand by any user easily in his/her local language.
                }else {
                    // Naviagate to chat vc.
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }

}


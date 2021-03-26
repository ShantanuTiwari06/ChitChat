//
//  ViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//
// For testing purpose ---
// Note :- 1.The user Id : 1@2.com ,pwd : 123456
//         2.The user Id : a@b.com ,pwd : 123456

// Otherwise if you want to make your own do register yourself by register option in app.

import UIKit
//import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        titleLabel.text = "⚡️ChitChat"
        
        // This is old method (withoud CLTypingLabel Pod method).
//        // Animation Code STR
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
//        // Animation Code END

    }
      
}



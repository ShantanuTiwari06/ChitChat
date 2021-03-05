//
//  ViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//
import UIKit
//import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var titleLabel: CLTypingLabel!
    
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



//
//  ViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Animation Code STR
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡️ChitChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        // Animation Code END

    }
      
}



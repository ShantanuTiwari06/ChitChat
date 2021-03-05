//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Shantanu on 31/12/20.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️ChitChat"
        navigationItem.hidesBackButton = true
    }
    
    // send btn
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

}

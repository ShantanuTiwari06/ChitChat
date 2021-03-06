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
    
    var messages : [Message] = [
        Message(sender: "1@2.com", body: "Hello"),
        Message(sender: "a@b.com", body: "Hey! What's Up"),
        Message(sender: "1@2.com", body: "Fine!"),
    ]
    
    //MARK:- ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      tableView.delegate = self
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

    }
    
    //MARK:- Send Button
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    //MARK:- LogOut Button
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

}


extension ChatViewController : UITableViewDataSource {
    // DataSource is the protocol that responsible for populating the TableView. So, telling it how many cells it needs & which cells that put into the tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)  as! MessageCell
        
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    
}

//extension ChatViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(messages[indexPath.row].body)
//    }
//}

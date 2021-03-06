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
    
    let db = Firestore.firestore()
    
    var messages : [Message] = [
//        Message(sender: "1@2.comf", body: "Hello"),
//        Message(sender: "a@b.com", body: "Hey! What's Up"),
//        Message(sender: "1@2.com", body: "Fine!"),
    ]
    
    //MARK:- ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      tableView.delegate = self
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

        loadMessages()
    }
    
    
    //MARK:- Load Messages
    func loadMessages() {
        // In place of addSnapshotListener place this -> getDocuments for : only read data when app loads first time.
        // addSnapshotListener -> used for realtime updates.
        // But after doing these when u send any newMsg & press send btn then u can see all the oldder data again reloaded.
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
        
            self.messages = []

            if let e = error {
                print("This is DB Error for reading data from FireStore : \(e)")
            }else{
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        print(doc.data())
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let message = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: message)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async { // Good practice to reloadData of TableView.
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    //MARK:- Send Button
    @IBAction func sendPressed(_ sender: UIButton) {
//        timeIntervalSince1970 -> this gives us is the no. of seconds since january the 1st at 0 hour in 1970.
        if let messageBody = messageTextfield.text , let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField : messageBody, K.FStore.dateField : Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print("This is DB Error for saving data to FireStore : \(e)")
                }else {
                    print("Success")
                }
            }
        }
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


//MARK:- Ex-TableView DataSource
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

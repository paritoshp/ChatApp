//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Paritosh Pawar on 25/09/18.
//  Copyright © 2018 Mindstix. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var submitButtonOutlet: UIButton!
    @IBOutlet weak var existingUserButtonOutlet: UIButton!
    
    var isExistingUser : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.title = "ChatApp"
    }
    
    
    @IBAction func submitButtonclicked(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailIDTextField.text!, password: passwordTextField.text!) { (user, error) in
            if ((error?.localizedDescription) != nil) {
                // Handle error and show popup
                print("Error")
                self.showAlertPopup(messageTitle: "Error", messageData: error?.localizedDescription ?? "")
            }else {
                let ContactsListVC = ContactsListViewController()
                self.navigationController?.pushViewController(ContactsListVC, animated: false)
            }
        }
    }
    
    @IBAction func ExistingUserClicked(_ sender: Any) {
        self.isExistingUser = true
        let signInVC = SignInViewController()
        self.navigationController?.pushViewController(signInVC, animated: false)
    }
    
    func showAlertPopup(messageTitle : String , messageData : String) {
        
        let alert = UIAlertController(title: messageTitle, message: messageData, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
        })
        self.present(alert, animated: true)
    }
}

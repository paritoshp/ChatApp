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
        
        if isExistingUser {
            Auth.auth().signIn(withEmail: emailIDTextField.text!, password: passwordTextField.text!) { (user, error) in
                if ((error?.localizedDescription) != nil) {
                    // Handle error and show popup
                }else {
                    let ContactsListVC = ContactsListViewController()
                    self.navigationController?.pushViewController(ContactsListVC, animated: false)
                }
            }
        } else {
            Auth.auth().createUser(withEmail: emailIDTextField.text!, password: passwordTextField.text!) { (authResult, error) in
                // ...
                guard (authResult?.user) != nil else {return}
                let ContactsListVC = ContactsListViewController()
                self.navigationController?.pushViewController(ContactsListVC, animated: false)
            }
        }
    }

    @IBAction func ExistingUserClicked(_ sender: Any) {
        self.isExistingUser = true
        self.loginLabel.text = "Sign in To Your Account"
    }
}

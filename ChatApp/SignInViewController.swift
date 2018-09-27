//
//  SignInViewController.swift
//  ChatApp
//
//  Created by Paritosh Pawar on 27/09/18.
//  Copyright © 2018 Mindstix. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailIDTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailIDTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            guard (authResult?.user) != nil else {
                
                self.showAlertPopup(messageTitle: "Error", messageData: (error?.localizedDescription)!)
                return
                
            }
            let ContactsListVC = ContactsListViewController()
            self.navigationController?.pushViewController(ContactsListVC, animated: false)
            
        }
    }
    
    func showAlertPopup(messageTitle : String , messageData : String) {
        
        let alert = UIAlertController(title: messageTitle, message: messageData, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
        })
        self.present(alert, animated: true)
    }
}

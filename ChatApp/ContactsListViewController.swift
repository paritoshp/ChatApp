//
//  ContactsListViewController.swift
//  ChatApp
//
//  Created by Paritosh Pawar on 25/09/18.
//  Copyright © 2018 Mindstix. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {

    var nameArray : NSMutableArray? = ["Paritosh","Nikhil","Sanjay","Akash","Ajit","Roshan","Tom"]
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.navigationItem.title = "Contact list"
        // Do any additional setup after loading the view.
    }

}

extension ContactsListViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        cell.accessoryType = .detailDisclosureButton
        cell.textLabel!.font = UIFont(name:"Avenir", size:22)
        cell.textLabel?.text = nameArray![indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        sensorDetailsToSendToNextVC = self.sensorDetailsObject[indexPath.row]
//        let vc = AddSensorDetailsPopOverViewController()
//        vc.sensorDetailsObject = sensorDetailsToSendToNextVC
//        vc.selectedTypeForSensor = sensorDetailsToSendToNextVC.sensorType
//        self.present(vc, animated: false, completion: nil)
        let ChatVCObject = ChatViewController()
        self.navigationController?.pushViewController(ChatVCObject, animated: false)
        
    }
}

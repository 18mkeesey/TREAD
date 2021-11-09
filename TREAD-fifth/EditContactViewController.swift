//
//  EditContactViewController.swift
//  TREAD-fifth
//
//  Created by Marissa Keesey on 11/9/21.
//

import UIKit

class EditContactViewController: UIViewController {
    var newname: String = ""
    var newphone: Int = 0

    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let contactListVC = ContactListViewController()
        print(contactListVC.currentrow)
//        contactName.text = contactListVC.contacts[contactListVC.currentrow].name
//        contactPhone.text = String(contactListVC.contacts[contactListVC.currentrow].phone)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            newname = contactName.text!
            newphone = Int(contactPhone.text!) ?? 0
        }
    }
}


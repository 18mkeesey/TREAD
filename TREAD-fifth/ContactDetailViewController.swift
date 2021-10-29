//
//  ContactDetailViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/29/21.
//

import UIKit

class ContactDetailViewController: UIViewController {
    var name: String = ""
    var phone: Int = 0

    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            name = contactName.text!
            phone = Int(contactPhone.text!) ?? 0
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SettingsViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/30/21.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {
    var userName: String = "Mars"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func mySettingsUnwindAction(unwindSegue: UIStoryboardSegue){
    }
    @IBOutlet weak var field: UITextField!

    @IBAction func getVal () {
    let userName: String = field.text!
        print(userName)
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

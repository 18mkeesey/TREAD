//
//  ViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/29/21.
//

import UIKit
import MessageUI

protocol ViewControllerDelegate: AnyObject {
    func update(_ contacts: [ContactListViewController.Contact])
}

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
   
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func displayMessageInterface() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["17148831711"]
        composeVC.body = "We did it?"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
    
    @IBAction func sendMessageButtonAction(_ sender: Any) {
        let view = ContactListViewController()
        view.findPrimary()
        
        displayMessageInterface()
    }
    
    @IBAction func myHomeUnwindAction(unwindSegue: UIStoryboardSegue){
    }
    
}


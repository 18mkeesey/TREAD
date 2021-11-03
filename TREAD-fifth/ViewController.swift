//
//  ViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/29/21.
//

import UIKit
import MessageUI
import UserNotifications

protocol ViewControllerDelegate: AnyObject {
    func update(_ contacts: [ContactListViewController.Contact])
}

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ask for notification permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound])
            { (granted, error) in
        }
        //notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey this is a notification"
        content.body = "AAAAAAAAAAAAAAAAAAAAAAAAAA"
        
        //notification trigger
        let date = Date().addingTimeInterval(15)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //register the request
        center.add(request) { (error) in
            //check the error parameter for errors
        }
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
        let view = ContactListViewController();
        view.findPrimary()
        
        displayMessageInterface()
    }
    
    @IBAction func myHomeUnwindAction(unwindSegue: UIStoryboardSegue){
    }
    
}


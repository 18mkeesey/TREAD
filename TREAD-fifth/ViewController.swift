//
//  ViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/29/21.
//

import UIKit
import MessageUI
import UserNotifications
import CocoaMQTT

protocol ViewControllerDelegate: AnyObject {
    func update(_ contacts: [ContactListViewController.Contact])
}

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    let SettingsView = SettingsViewController()
    
    var mqtt: CocoaMQTT!
    
    @IBOutlet weak var datareceived: UITextView!
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didActivate), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didEnterBackgroundNotification, object: nil)
        
        setUpMQTT()
        mqtt.delegate = self
        
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
        composeVC.body = "\(SettingsView.userName) needs help!"
        print("\(SettingsView.userName) needs help!")
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
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    //Notification, when the App is activated, I restore the connection with Mqtt broker
    @objc func didActivate(){
        let _: Bool = mqtt.connect()
    }
    
    //Notification, when the App enters in background, I disconnect the mqtt Object
    @objc func didEnterBackground(){
        mqtt.disconnect()
    }

    //Setup mqtt client
    func setUpMQTT() {
        var connected:Bool = false
        
        //1. Definition of the client Identificator
        //let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)

        //2. Definition of mqtt broker connection
        mqtt = CocoaMQTT(clientID: "iOS Device", host: "10.40.11.10", port: 1883)
        
        //3. Setup the username and password if supported otherwise do not set
        //mqtt.username = "test"
        //mqtt.password = "public"
        
        //4. Definition of will message topic and connection
        mqtt.willMessage = CocoaMQTTWill(topic: "/sensors/temperature", message: "dieout")
        mqtt.keepAlive = 60
        connected = mqtt.connect()
        if connected{
            print("Connected to the broker")
        }
        else{
            print("Not connected to the broker")
        }
    }
}

extension ViewController: CocoaMQTTDelegate {
    
    //1. Connection with Broker, time to subscribe to a topic
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        mqtt.subscribe("/sensors/temperature")
    }

    //2. Reception of mqtt message in the topic "/sensors/temperature"
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16 ){
        datareceived.text = message.string!
        print(message.string!)
    }
    
    // Other required methods for CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {}
    func mqtt(_ mqtt: CocoaMQTT, didConnect host: String, port: Int) {}
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {}
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {}
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {}
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {}
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {}
    func mqttDidPing(_ mqtt: CocoaMQTT) {}
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {}
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {}
    func _console(_ info: String) {}
}

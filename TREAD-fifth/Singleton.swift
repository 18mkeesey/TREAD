////
////  Singleton.swift
////  TREAD-fifth
////
////  Created by mars keesey on 10/30/21.
////
//
//import Foundation
//import UIKit
//
//class Singleton {
//     static var shared: Singleton = {
//        let instance = Singleton()
//        return instance
//    }()
//    
//    var contacts :[ContactListViewController.Contact]
//    
//
//    //static let shared :Singleton = Singleton()
//    
//    private init() {
//        self.contacts = [ContactListViewController.Contact(name:"Mars", phone: 1230994810, primary: true), ContactListViewController.Contact(name: "Sharice", phone: 2019330303, primary: false)]
//    }
//
//    
//    func addContact(name :String, phone :Int, primary :Bool) {
//        let newContact = ContactListViewController.Contact(name: name, phone: phone, primary: primary)
//        
//        contacts.append(newContact)
//    }
//    func getContacts() -> [ContactListViewController.Contact] {
//        return self.contacts
//    }
//    
////    extension Singleton: NSCopying {
////
////        func copy(with zone: NSZone? = nil) -> Any {
////            return self
////        }
////    }
////    
//}

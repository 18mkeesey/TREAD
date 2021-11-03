//
//  ContactListViewController.swift
//  TREAD-fifth
//
//  Created by mars keesey on 10/29/21.
//

import UIKit

class ContactListViewController: UITableViewController {
    
//    func setPrimary(contact :Contact) {
//        contacts.map{ (current) in
//            current.primary = false
//        }
//        contact.primary = true
//    }
    
    class Contact{
        var name: String;
        var phone: Int;
        var primary: Bool = false;
        init(name:String, phone :Int, primary :Bool){
            self.name = name
            self.phone = phone
            self.primary = primary
        }
        
        func setName(newName :String) {
            self.name = newName
        }
        
        func setPhone(newPhone :Int) {
            self.phone = newPhone
        }

    }
    
    var primaryContact: Contact = Contact(name: "bob", phone: 9930303303, primary: false)
    
    func findPrimary() {
        for contact in contacts {
            if (contact.primary == true) {
                primaryContact = contact
                print(primaryContact.name)
            }
        }
   
    }
    
    var contacts = [Contact]()
    var newContact: Contact = Contact(name: "", phone: 0, primary: false)


    @IBAction func cancel(segue:UIStoryboardSegue) {
      
    }

    @IBAction func done(segue:UIStoryboardSegue) {
       let contactDetailVC = segue.source as! ContactDetailViewController
       let newContactName = contactDetailVC.name
       let newContactPhone = contactDetailVC.phone
        newContact = Contact(name: newContactName, phone: newContactPhone, primary: false)
        
 
        contacts.append(newContact)
        tableView.reloadData()
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = [Contact(name:"Mars", phone: 1230994810, primary: true), Contact(name: "Sharice", phone: 2019330303, primary: false)]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        cell.textLabel?.text = contacts[indexPath.row].name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  LoginViewController.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,AddAppointmentViewControllerDelegate,UITextFieldDelegate {
    
    var itemStore = ItemStore()
    var rowCount = 0
    
    @IBOutlet weak var adminloginbutton: UIButton!
    @IBOutlet weak var passwordfield: UITextField!
    @IBOutlet weak var emailfield: UITextField!
    
    // Archive file
    static let documentsDirectory = NSFileManager().URLsForDirectory(
        .DocumentDirectory,
        inDomains: .UserDomainMask).first!
    
    static let archiveURL = documentsDirectory.URLByAppendingPathComponent("items")
    
//    var issuesArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailfield.delegate = self
        passwordfield.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDidEnterInformation(issuedictionary: NSMutableDictionary) {
        itemStore.addItem(issuedictionary)
    }
    
    @IBAction func login(sender: AnyObject) {
        self.performSegueWithIdentifier("iscustomer", sender: self)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if emailfield.text == "admin@budgetmuffler.com" && passwordfield.text == "password" {
            self.adminloginbutton.enabled = true
        }
        else
        {
            self.adminloginbutton.enabled = false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "iscustomer" {
            let controller = segue.destinationViewController as! AddAppointmentViewController
            controller.delegate = self
        }
        else if segue.identifier == "isadmin"
        {
            let destination = segue.destinationViewController as? AppointmentsTableViewController
            
            destination?.itemStore = itemStore
        }
    }
    
    func saveToDB() {
        let success = NSKeyedArchiver.archiveRootObject(itemStore,
                                                        toFile: LoginViewController.archiveURL!.path!)
        
        if !success {
            print("Failed...")
        }
    }
    
    func loadFromDB() {
        let unArchived = NSKeyedUnarchiver.unarchiveObjectWithFile(
            LoginViewController.archiveURL!.path!)
        let unArchivedStore = unArchived as? ItemStore
        
        if unArchivedStore != nil
        {
            itemStore = unArchivedStore!
            rowCount  = itemStore.itemCount()
        }
        else {
            print("Failed...")
        }
    }
}

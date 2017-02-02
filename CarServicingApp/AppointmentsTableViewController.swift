//
//  AppointmentsTableViewController.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class AppointmentsTableViewController: UITableViewController, UITextFieldDelegate {
    
    var issueslistArray = NSArray()
    var itemStore = ItemStore()
    var issuestatus = ""
    let issueDict = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.itemCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AppointmentTableViewCell
        cell.statusfield.delegate = self
        cell.statusfield.tag = indexPath.row
        let row  = indexPath.row
        let appointment = itemStore.getItem(row)
        let aptno = appointment.carno
        let carmodel = appointment.carmodel
        let status = appointment.appointmentstatus
        
        cell.carnolabel?.text = aptno
        
        cell.carmodellabel?.text = carmodel
        cell.statusfield?.text = status
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        issuestatus = textField.text!
        let issue = itemStore.getItem(textField.tag)
        issue.appointmentstatus = textField.text!
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "issuedetailssegue"
        {
            let destination = segue.destinationViewController as? AppointmentsDetailViewController
            let row = tableView.indexPathForSelectedRow?.row
            let issue = itemStore.getItem(row!)
            destination?.item = issue
            
            destination?.currentissuestatus = issuestatus
        }
        
    }
    
    
    
    
}

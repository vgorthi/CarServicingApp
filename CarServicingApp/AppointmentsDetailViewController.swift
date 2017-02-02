//
//  AppointmentsDetailViewController.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class AppointmentsDetailViewController: UIViewController {
    
    var item : Item?
    var itemStore = ItemStore()
    var currentissuestatus = ""
    
    @IBOutlet weak var carnolabel: UITextField!
    @IBOutlet weak var carproblemlabel: UITextView!
    @IBOutlet weak var statusfield: UITextField!
    @IBOutlet weak var timeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        carnolabel.text = (item?.carno)
        timeLabel.text = (item?.appointmentdatetime)
        carproblemlabel.text = (item?.carproblem)
        statusfield.text = currentissuestatus
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

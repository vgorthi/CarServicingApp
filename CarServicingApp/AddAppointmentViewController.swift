//
//  AddAppointmentViewController.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

protocol AddAppointmentViewControllerDelegate: class {
    func userDidEnterInformation(issuedictionary: NSMutableDictionary)
}

class AddAppointmentViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate {
    
    weak var delegate: AddAppointmentViewControllerDelegate? = nil
    let datetimepicker = UIDatePicker()
    let appointmentDetails = NSMutableDictionary()
    
    let cartypePickerArray: NSArray = ["Hyundai", "Honda", "Toyota", "Nissan","Mercedes","BMW"]
    
    @IBOutlet weak var carnotextfield: UITextField!
    
    @IBOutlet weak var emailidtextfield: UITextField!
    
    @IBOutlet weak var phonenumbertextfield: UITextField!
    
    @IBOutlet weak var cartypefield: UITextField!
    
    @IBOutlet weak var datetimefield: UITextField!
    
    @IBOutlet weak var problemsfield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carnotextfield.delegate = self
        emailidtextfield.delegate = self
        phonenumbertextfield.delegate = self
        cartypefield.delegate = self        
        datetimefield.delegate = self
        problemsfield.delegate = self
        
        problemsfield.layer.borderColor = UIColor.blackColor().CGColor
        problemsfield.layer.borderWidth = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // UITextViewDelegate
    func textViewShouldReturn(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    func datePickerChanged(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        datetimefield.text = strDate
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.tag == 100{
            let issuetypepicker = UIPickerView()
            issuetypepicker.tag = 100
            issuetypepicker.delegate = self
            issuetypepicker.dataSource = self
            
            textField.inputView = issuetypepicker
            
            let toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, 40))
            
            toolBar.barStyle = UIBarStyle.Default
            
            toolBar.tintColor = UIColor.blackColor()
            
            toolBar.backgroundColor = UIColor.clearColor()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(AddAppointmentViewController.DoneButtonPressed))
            
            let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(AddAppointmentViewController.cancelButtonPressed))
            
            let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
            
            toolBar.items = [cancelButton, space, doneButton]
            
            textField.inputAccessoryView = toolBar
        }
        else if textField.tag == 101
        {
            datetimepicker.datePickerMode = UIDatePickerMode.DateAndTime
            datetimepicker.addTarget(self, action: #selector(self.datePickerChanged), forControlEvents: UIControlEvents.ValueChanged)

            textField.inputView = datetimepicker
            
            let toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, 40))
            
            toolBar.barStyle = UIBarStyle.Default
            
            toolBar.tintColor = UIColor.blackColor()
            
            toolBar.backgroundColor = UIColor.clearColor()
            
            let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(AddAppointmentViewController.DoneButtonPressed))
            
            let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(AddAppointmentViewController.cancelButtonPressed))
            
            toolBar.items = [cancelButton, space, doneButton]
            
            textField.inputAccessoryView = toolBar
        }
    }
    
    func DoneButtonPressed()
    {
        cartypefield.resignFirstResponder()
        datetimefield.resignFirstResponder()
    }
    
    func cancelButtonPressed()
    {
        cartypefield.resignFirstResponder()
        datetimefield.resignFirstResponder()
    }

    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        appointmentDetails["carno"] = carnotextfield.text
        appointmentDetails["appointmentemailid"] = emailidtextfield.text
        appointmentDetails["appointmentphoneno"] = phonenumbertextfield.text
        appointmentDetails["carmodel"] = cartypefield.text
        appointmentDetails["appointmentdatetime"] = datetimefield.text
        appointmentDetails["carproblem"] = problemsfield.text
        appointmentDetails["status"] = "Open"
        
        self.delegate?.userDidEnterInformation(appointmentDetails)
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var couunt = Int()
        
        if pickerView.tag == 100 {
            couunt = cartypePickerArray.count
        }
        
        return couunt
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var str = String()
        
        if pickerView.tag == 100 {
            
            str = cartypePickerArray.objectAtIndex(row) as! String
        }
    
        return str
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 100 {
            cartypefield.text = cartypePickerArray.objectAtIndex(row) as? String
        }
    }
}

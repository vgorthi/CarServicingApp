//
//  Item.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    var carno = ""
    var appointmentemailid = ""
    var appointmentphoneno = ""
    var carmodel = ""
    var appointmentdatetime = ""
    var carproblem = ""
    var appointmentstatus = ""
    
    override init() {
        super.init()
    }
    
    init(_ carno : String, _ appointmentemailid : String,_ appointmentphoneno : String, _ carmodel : String,_ appointmentdatetime : String, _ carproblem : String, _ appointmentstatus : String) {
        super.init()
        self.carno = carno
        self.appointmentemailid = appointmentemailid
        self.appointmentphoneno = appointmentphoneno
        self.carmodel = carmodel
        self.appointmentdatetime = appointmentdatetime
        self.carproblem = carproblem
        self.appointmentstatus = appointmentstatus
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(carno, forKey: "carno")
        aCoder.encodeObject(appointmentemailid, forKey: "appointmentemailid")
        aCoder.encodeObject(appointmentphoneno, forKey: "appointmentphoneno")
        aCoder.encodeObject(carmodel, forKey: "carmodel")
        aCoder.encodeObject(appointmentdatetime, forKey: "appointmentdatetime")
        aCoder.encodeObject(carproblem, forKey: "carproblem")
        aCoder.encodeObject(appointmentstatus, forKey: "status")
    }
    
    required init?(coder aDecoder: NSCoder) {
        carno = (aDecoder.decodeObjectForKey("carno") as? String)!
        appointmentemailid = (aDecoder.decodeObjectForKey("appointmentemailid") as? String)!
        appointmentphoneno = (aDecoder.decodeObjectForKey("appointmentphoneno") as? String)!
        carmodel = (aDecoder.decodeObjectForKey("carmodel") as? String)!
        appointmentdatetime = (aDecoder.decodeObjectForKey("appointmentdatetime") as? String)!
        carproblem = (aDecoder.decodeObjectForKey("carproblem") as? String)!
        appointmentstatus = (aDecoder.decodeObjectForKey("status") as? String)!
    }
}

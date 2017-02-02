//
//  ItemStore.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class ItemStore: NSObject, NSCoding {
    var items = [Item]()
    
    override init (){
        super.init()
    }
    
    func addItem(info: NSMutableDictionary) {
        let item = Item()
        
        item.carno = (info.objectForKey("carno") as? String)!
        item.appointmentemailid = (info.objectForKey("appointmentemailid") as? String)!
        item.appointmentphoneno = (info.objectForKey("appointmentphoneno") as? String)!
        item.carmodel = (info.objectForKey("carmodel") as? String)!
        item.appointmentdatetime = (info.objectForKey("appointmentdatetime") as? String)!
        item.carproblem = (info.objectForKey("carproblem") as? String)!
        item.appointmentstatus = (info.objectForKey("status") as? String)!
        items.append(item)
    }
    
    func getItem(index : Int) -> Item {
        return items[index]
    }
    
    func insertItem(index: Int) {
        let item = Item()
        items.insert(item, atIndex: index)
    }
    
    func deleteItem(index : Int) {
        items.removeAtIndex(index)
    }
    
    func swapItems(first: Int, second: Int) {
        let tmp = items[first]
        items[first]  = items[second]
        items[second] = tmp
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(items, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = (aDecoder.decodeObjectForKey("items") as? [Item])!
    }
}

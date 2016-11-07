//
//  TableViewController.swift
//  5CMenuTutorial
//
//  Created by Maddie on 11/4/16.
//  Copyright © 2016 Maddie Zug. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class MenuViewController: UITableViewController {
    
    var menuItems: [String] = []
    var selectedDiningHall: String? //This value is an optional: its value can be nil at any time

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var apiDiningHall = ""
        
        //Here we unwrap our optional to make sure it isn't nil
        if let selectedDiningHall = selectedDiningHall{
        
        //The ASPC Menu API needs the name of the dining hall to be formatted in a specific way when we make our API call.
        //here we swap out our dining hall name for the name that the ASPC API prefers.
            switch selectedDiningHall{
            case "Frary":
                apiDiningHall = "frary"
            case "Frank":
                apiDiningHall = "frank"
            case "Collins":
                apiDiningHall = "cmc"
            case "Scripps":
                apiDiningHall = "scripps"
            case "Mudd":
                apiDiningHall = "mudd"
            case "Oldenborg":
                apiDiningHall = "oldenborg"
            case "Pitzer":
                apiDiningHall = "pitzer"
            default:
                apiDiningHall = ""
            }
            
        }
        
        // returns an integer from 1 - 7, with 1 being Sunday and 7 being Saturday
        let dayAsInt = NSDate().dayOfWeek()!
        var apiDay = ""
        
        //Format the day of the week so the ASPC API will be happy
        switch  dayAsInt{
        case 1:
            apiDay = "sun"
        case 2:
            apiDay = "mon"
        case 3:
            apiDay = "tue"
        case 4:
            apiDay = "wed"
        case 5:
            apiDay = "thu"
        case 6:
            apiDay = "fri"
        case 7:
            apiDay = "sat"
        default:
            apiDay = ""
        }

        //Read in data from the ASPC Menu API
        Alamofire.request(.GET, "https://aspc.pomona.edu/api/menu/dining_hall/"+apiDiningHall+"/day/"+apiDay+"?auth_token=8227601fb7f5768fb6ccf9f5ab38c4700b884ea0").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                let foodItems = json[0]["food_items"]
                self.menuItems = foodItems.arrayObject as! [String]
                
                //Update our table to show our menu data!
                self.tableView.reloadData()
                
            }
        }
        
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
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuItemCell", forIndexPath: indexPath)

        cell.textLabel?.text = menuItems[indexPath.row]
        
        return cell
    }
    

}

//Gets us the current day of the week
extension NSDate {
    func dayOfWeek() -> Int? {
        guard
            let cal: NSCalendar = NSCalendar.currentCalendar(),
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) else { return nil }
        return comp.weekday
    }
}



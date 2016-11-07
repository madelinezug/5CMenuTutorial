//
//  TableViewController.swift
//  5CMenuTutorial
//
//  Created by Maddie on 11/4/16.
//  Copyright © 2016 Maddie Zug. All rights reserved.
//

import UIKit

class DiningHallViewController: UITableViewController {
    
    var diningHalls: [String] = ["Frank", "Frary", "Collins", "Scripps", "Mudd", "Pitzer", "Oldenborg"]
    var selectedDiningHall:String = "";

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //We only have one section on this screen- the dining halls at the 5Cs
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diningHalls.count //We have 7 dining halls in our tableView
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("diningHallCell", forIndexPath: indexPath)

         cell.textLabel?.text = diningHalls[indexPath.row] //display each dining hall on a different row
        print(cell.textLabel?.text)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedDiningHall = diningHalls[indexPath.row]
    }
 
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
        print(segue.identifier)
        print(segue.destinationViewController)
        if(segue.identifier == "showMenu"){
            if let destination = segue.destinationViewController as? MenuViewController {
                destination.selectedDiningHall = self.selectedDiningHall
                print(self.selectedDiningHall)
            }
            
        }
    }
 

}

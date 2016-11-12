//
//  ViewController.swift
//  Delegates Challenge
//
//  Created by Carmen Chung on 11/10/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CustomCellDelegate, CancelButtonDelegate, DoneButtonDelegate, UpdateInfoDelegate {
    var pictures = ["A","B","C","D","E"]
    var ImageName = ["A","B","C","D","E"]
    var imagedescriptions = ["this is the first letter","this is the second letter","this is the third letter","this is the fourth letter","this is the fifth letter"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! CustomCell
        cell.buttonDelegate = self
        cell.Name.text = pictures[indexPath.row]
        cell.MainImage.image = UIImage(named: ImageName[indexPath.row])
        return cell
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    func DescriptionButtonPressed(sender: CustomCell) {
        performSegueWithIdentifier("GoToDescription", sender: sender)
    }
    func AddButtonPressed(sender: CustomCell) {
        performSegueWithIdentifier("GoToAdd", sender: sender)
    }
    
    func CancelButtonPressed(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func DoneButtonPressed(controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?) {
        print ("its working")
        dismissViewControllerAnimated(true, completion: nil)
        pictures.append(picturename!)
        imagedescriptions.append(picturedescription!)
        tableView.reloadData()
        
        
    }
    func DoneButtonPressed(controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        pictures[indexpath] = picturename!
        imagedescriptions[indexpath] = picturedescription!
        print (pictures)
        print (imagedescriptions)
        tableView.reloadData()
    }
    
    // We can perform a segue in here
    func performSegueForCell(sender: CustomCell) {
        // What you have to do now:
        // 1. Be able to call this method from the cell *** Delegates ***
        // 2. input this method into some delegate so that we can refer to it
        
        performSegueWithIdentifier("GoToDescription", sender: sender)
    }
    
    func UpdateInfoWith(pictureName picturename: String?, picturedescription: String?, imagename: String?, atIndexPath indexpath: Int) {
        print("Tada")
        pictures[indexpath] = picturename!
        imagedescriptions[indexpath] = picturedescription!
        print (pictures)
        print (imagedescriptions)
        tableView.reloadData()
        // This is where we can use the info to update our array
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print ("preparing for segue")
        if segue.identifier=="GoToAdd" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddViewController
            controller.cancelButtonDelegate=self
            controller.doneButtonDelegate=self
        }
        else if segue.identifier == "GoToDescription" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! UpdateViewController
            controller.cancelButtonDelegate=self
            controller.customCellDelegate=self
            controller.updateInfoDelegate = self
            if let indexPath = tableView.indexPathForCell(sender as! CustomCell) {
                controller.updatename = pictures[indexPath.row]
                controller.updatedescription = imagedescriptions[indexPath.row]
                controller.updatecellpath = indexPath.row
                controller.updateimagename = ImageName[indexPath.row]

            }
        }
    }
}


//
//  UpdateViewController.swift
//  Delegates Challenge
//
//  Created by Carmen Chung on 11/10/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import Foundation
import UIKit

class UpdateViewController: UITableViewController, CancelButtonDelegate, DoneButtonDelegate {
    var updatename: String?
    var updatedescription: String?
    var updatecellpath: Int?
    var updateimagename: String?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    weak var updateInfoDelegate: UpdateInfoDelegate?
    weak var customCellDelegate: CustomCellDelegate?
    func CancelButtonPressed(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        print ("updateviewcontroller")
        UpdateNameLabel.text = updatename
        UpdateImage.image = UIImage(named: updateimagename!)
        UpdateDescription.text = updatedescription
        
    }
    @IBAction func CancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.CancelButtonPressed(self)
    }
    
    @IBOutlet weak var UpdateNameLabel: UILabel!
    
    
    @IBOutlet weak var UpdateImage: UIImageView!
    
    
    @IBOutlet weak var UpdateDescription: UILabel!
    @IBAction func updateButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("GoToUpdate", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="GoToUpdate" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddViewController
            controller.cancelButtonDelegate = self
            controller.doneButtonDelegate = self
            controller.addname = updatename
            controller.adddescription = updatedescription
            controller.addImage = updatecellpath
            controller.addimagefilename = updateimagename
            }

    }
    func DoneButtonPressed(controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?) {
        print ("its working")
        
    }
    func DoneButtonPressed(controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int) {
        print("it's working")
        // First step is to update the fields on this page
        UpdateNameLabel.text = picturename
        UpdateDescription.text = picturedescription
        
        // You also need to update image and description here
        
        // Second step is to send that info to the viewcontroller page so that we can update that info
        updateInfoDelegate?.UpdateInfoWith(pictureName: picturename, picturedescription: picturedescription ,imagename: imagename, atIndexPath: indexpath)
        dismissViewControllerAnimated(true, completion: nil)
    }

}

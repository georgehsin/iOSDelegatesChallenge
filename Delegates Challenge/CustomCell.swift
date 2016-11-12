//
//  CustomCell.swift
//  Delegates Challenge
//
//  Created by Carmen Chung on 11/10/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var buttonDelegate : CustomCellDelegate?
    weak var customCellDelegate: CustomCellDelegate?
    @IBOutlet weak var MainImage: UIImageView!
    
    
    @IBOutlet weak var Name: UILabel!
    
    @IBAction func DescriptionButtonPressed(sender: UIButton) {
        // First We click this button
        // When we click we want to segue
        // We want to try to perform segue here
        // Somehow get someone to perform segue for us *** Delegates ***
        buttonDelegate?.DescriptionButtonPressed(self)
        print("Description")
    }
    
    
}

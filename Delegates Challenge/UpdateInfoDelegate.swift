//
//  UpdateInfoDelegate.swift
//  Delegates Challenge
//
//  Created by George Hsin on 11/11/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateInfoDelegate: class {
    func UpdateInfoWith(pictureName picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int)
}


//
//  DoneButtonDelegate.swift
//  Delegates Challenge
//
//  Created by Carmen Chung on 11/10/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import Foundation

protocol DoneButtonDelegate: class {
    func DoneButtonPressed(controller: AddViewController, finishedAdding picturename:String?, picturedescription:String?, imagename:String?)
    func DoneButtonPressed(controller: AddViewController, finishedUpdating picturename:String?, picturedescription:String?, imagename:String?, atIndexPath indexpath: Int)
}

//
//  CustomCellDelegate.swift
//  Delegates Challenge
//
//  Created by Carmen Chung on 11/10/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import Foundation

protocol CustomCellDelegate: class {
    func DescriptionButtonPressed(sender: CustomCell)
    func AddButtonPressed(sender: CustomCell)
}

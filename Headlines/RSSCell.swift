//
//  RSSCell.swift
//  Headlines
//
//  Created by Ferdinando Furci on 14/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import Foundation
import UIKit


class RSSCell : UITableViewCell {
    
    
    
    @IBOutlet weak var mTitle: UITextView!
    
   
    @IBOutlet weak var mImage: UIImageView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}
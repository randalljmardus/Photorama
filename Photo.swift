//
//  Photo.swift
//  Photorama
//
//  Created by Randall Mardus on 5/10/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit
import CoreData


class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    var image: UIImage?
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        //give the properties their initial values
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }

}

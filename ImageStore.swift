//
//  ImageStore.swift
//  Homepwner
//
//  Created by Randall Mardus on 5/5/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache()
    
    func imageURLForKey(key: String) -> NSURL {
        let documentsDirectories = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent(key)
    }

    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key)
        
        //create full URL for image
        let imageURL = imageURLForKey(key)
        
        //turn image into JPEG data
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            //write it to full URL
            data.writeToURL(imageURL, atomically: true)
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        if let existingImage = cache.objectForKey(key) as? UIImage {
            return existingImage
        }
        
        let imageURL = imageURLForKey(key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!)
            else {
                return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
        
        let imageURL = imageURLForKey(key)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
        }
        catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
}

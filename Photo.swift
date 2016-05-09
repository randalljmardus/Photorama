//
//  Photo.swift
//  Photorama
//
//  Created by Randall Mardus on 5/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class Photo {
    
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    var image: UIImage?
    
    init(title: String, photoID: String, remoteURL: NSURL, dateTaken: NSDate) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
}

extension Photo: Equatable {}

func == (lhs: Photo, rhs: Photo) -> Bool {
    //two photos are the same if they have the same photoID
    return lhs.photoID == rhs.photoID
}
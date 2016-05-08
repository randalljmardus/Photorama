//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Randall Mardus on 5/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

struct FlickrAPI {
    
    static let baseURLString = "https://api.flickr.com/services/rest"
}
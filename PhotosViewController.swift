//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Randall Mardus on 5/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("Sucessfully found \(photos.count) recent photos.")
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            }
        }
        
    }
}

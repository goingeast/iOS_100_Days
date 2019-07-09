//
//  FlickerPhoto.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/3/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import UIKit

class FlickrPhoto: NSObject {

    let photoId, serverId, secret: String
    let farmId : Int
    var thumbnail : UIImage?

    init(photoId: String, farmId: Int, serverId: String, secret: String) {
        self.photoId = photoId
        self.farmId = farmId
        self.serverId = serverId
        self.secret = secret
    }

    func flickerImageUrl(_ size :String = "m") -> URL? {
        if let url = URL(string: "https://farm\(farmId).staticflickr.com/\(serverId)/\(photoId)_\(secret)_\(size).jpg") {
            return url
        }
        return nil;
    }

    static func==(lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool{
        return lhs.photoId == rhs.photoId
    }

}

//
//  FlickrSearchResult.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/3/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import UIKit
import SwiftyJSON

class FlickrSearchResult {
    let searchTerm: String
    var photos : [FlickrPhoto] = []

    init(searchTerm: String, json : JSON) {
        self.searchTerm = searchTerm
        guard let statusOk = json["stat"].string else {
            return
        }

        for (key,subJson):(String, JSON) in json["photos"]["photo"] {
            // Do something you want
            print("dhd\(key) + \(subJson)")

            let image = FlickrPhoto(photoId: subJson["id"].stringValue, farmId: subJson["farm"].intValue, serverId: subJson["server"].stringValue, secret: subJson["secret"].stringValue)

//           if let imageUrl = image.flickerImageUrl() {
//
//                guard let imageData = try? Data(contentsOf: imageUrl) else {
//                    return
//                }
//
//                image.thumbnail = UIImage(data: imageData)
//            }
            photos.append(image)
        }

    }
}

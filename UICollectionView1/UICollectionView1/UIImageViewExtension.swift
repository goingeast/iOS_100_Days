//
//  UIImageViewExtension.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/7/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(url: URL?) {
        if let imageUrl = url {

            guard let imageData = try? Data(contentsOf: imageUrl) else {
                return
            }

            self.image = UIImage(data: imageData)
        }
    }
}

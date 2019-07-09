//
//  Result.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/3/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import Foundation

enum Result<ResultType> {
    case results(ResultType)
    case error(Error)
}

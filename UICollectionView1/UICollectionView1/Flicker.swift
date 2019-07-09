//
//  Flicker.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/3/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let apiKey = "9a611ece684d3a2b4f753a9dbb1259ad"
let flickrEndpoint = "https://api.flickr.com/services/rest/"

class Flicker: NSObject {

    func searchFlickr(for searchTerm: String, completion: @escaping(Result<FlickrSearchResult>) -> Void) {
        AF.request(flickrEndpoint, method: .get, parameters: flickrSearchParams(for: searchTerm)).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                let photosData: JSON = JSON(response.value!)
                let result = FlickrSearchResult(searchTerm: searchTerm, json: photosData)
                completion(Result.results(result))

            case .failure(let error):
                completion(Result.error(error))
            }

        }
    }

    private func flickrSearchParams(for searchTerm:String) -> [String:String]? {
        guard let escapedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else {
            return nil
        }

        let params: [String: String] = ["method"         : "flickr.photos.search",
                                        "api_key"        : apiKey,
                                        "text"           : escapedTerm,
                                        "per_page"       : "20",
                                        "format"         : "json",
                                        "nojsoncallback" : "1"];

        return params
    }

}

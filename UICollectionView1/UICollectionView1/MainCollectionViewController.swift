//
//  MainCollectionViewController.swift
//  UICollectionView1
//
//  Created by Zhao, Haoru on 7/3/19.
//  Copyright © 2019 strstr. All rights reserved.
//

import UIKit
import Foundation

private let reuseIdentifier = "FlickerCell"
private let sectionInsets = UIEdgeInsets(top: 50.0,
                                         left: 20.0,
                                         bottom: 50.0,
                                         right: 20.0)
private let itemsPerRow: CGFloat = 3

class MainCollectionViewController: UICollectionViewController {
    private var searches: [FlickrSearchResult] = []
    private let flickr = Flicker()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return searches.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return searches[section].photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCollectionViewCell
    
        // Configure the cell
        //2
        let flickrPhoto = photo(for: indexPath)
        cell.backgroundColor = .white
        //
        //cell.imageView.image = flickrPhoto.thumbnail

        cell.imageView.imageFromUrl(url: flickrPhoto.flickerImageUrl())
    
        return cell
    }

}

extension MainCollectionViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

private extension MainCollectionViewController {
    func photo(for indexPath: IndexPath) -> FlickrPhoto {
        return searches[indexPath.section].photos[indexPath.row]
    }
}

extension MainCollectionViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()

        flickr.searchFlickr(for: textField.text!) { result in
            activityIndicator.removeFromSuperview()

            switch result {
            case .error(let error) :
                print("Error Searching: \(error)")
            case .results(let results):
                print("Found \(results.photos.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                // 4
                self.collectionView?.reloadData()
            }
        }
        return true
    }
}

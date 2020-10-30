//
//  PhotosViewController.swift
//  VKClient
//
//  Created by Alexander Belyaev on 17.10.2020.
//

import UIKit

class PhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var photos: [String] = []
    var likePressed = false
    var likesCount = 123
    var myLike = 0
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    
    private enum Constants{
        static let padding: CGFloat = 5
        static let columns: CGFloat = 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
    
        let photo = photos[indexPath.row]
        
        cell.photoImageView.image = UIImage(named: "Avatars/\(photo)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Constants.padding) / Constants.columns
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }
    
}

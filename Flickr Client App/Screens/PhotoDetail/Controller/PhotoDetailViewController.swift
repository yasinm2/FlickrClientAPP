//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by Yasin Ağbulut on 20.04.2023.

//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Detail"
        
//        imageView.backgroundColor = .gray
//        ownerImageView.backgroundColor = .darkGray
//        ownerNameLabel.text = "Owner Name"
//        descriptionLabel.text = "Description Label Description Label Description Label Description Label Description Label"
        ownerImageView.layer.cornerRadius = 24.0
        ownerNameLabel.text = photo?.ownername
        title = photo?.title
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconURL) { data in
            self.ownerImageView.image = UIImage(data: data)
        }
        
        NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
        
        descriptionLabel.text = photo?.photoDescription?.content
        
        
    }
    
}

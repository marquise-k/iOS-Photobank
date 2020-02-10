//
//  PhotoItemCell.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation
import UIKit

class PhotoItemCell: UITableViewCell {
    
    
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var Likes: UILabel!
    @IBOutlet weak var Thumbnail: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    var photoItem: PhotoModel? {
        didSet {
            guard let photoItem = photoItem else {return}
            
            Username.text = photoItem.username
            Likes.text = "\(photoItem.likes) Likes"
            //Thumbnail.image = UIImage(data: photoItem.thumbnail)
            
        }
    }
}

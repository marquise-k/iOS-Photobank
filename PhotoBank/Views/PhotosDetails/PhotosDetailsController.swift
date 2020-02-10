//
//  PhotosDetails.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation
import UIKit

class PhotosDetailsController: UIViewController,  APICallManagerDelegate{
    
    func didUpdateSearch(response: PhotoModel) {
        
    }
    
    
    
    
    @IBOutlet weak var UserProfilePic: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserLocation: UILabel!
    @IBOutlet weak var PhotoDescription: UILabel!
    @IBOutlet weak var PhotoThumbnail: UIImageView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
    
}

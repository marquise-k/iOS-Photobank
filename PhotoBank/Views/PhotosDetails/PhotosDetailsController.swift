//
//  PhotosDetails.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation
import UIKit

class PhotosDetailsController: UIViewController {
    
    //func didUpdateSearch(response: PhotoModel) {
        
    
    
    
    @IBOutlet weak var UserProfilePic: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserLocation: UILabel!
    @IBOutlet weak var PhotoLikes: UILabel!
    @IBOutlet weak var PhotoThumbnail: UIImageView!
    

    var presenter: PhotoDetailsPresenter?
    var selectedPhoto: PhotoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.selectedPhoto = presenter?.photoSelected ?? []
        
        
        //Define closure for updating UIImageViews when they download
         let imageCompletionClosure = { [unowned self] ( imageData: NSData ) -> Void in
        
        // UI ipdate code must be on main thread
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, animations: {
                self.UserProfilePic?.image = UIImage(data: imageData as Data)
            })
        }
        
        
        
        //Update other UI elements with elements from the selected PhotoModel object
//        UserName.text = PhotoModel?.username
//        UserLocation.text = PhotoModel?.location
//        PhotoLikes.text = PhotoModel?.likes
        
        //start image downloading in background
        
       // PhotoModel?.download(completionHandler: imageCompletionClosure)
    }
  }
}


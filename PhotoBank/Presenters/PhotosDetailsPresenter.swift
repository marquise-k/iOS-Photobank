//
//  PhotosDetailsPresenter.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-10.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation

class PhotoDetailsPresenter {
    
    var photoSelected: PhotoModel?
    
//    init(with photoSelected: PhotoModel) {
//        self.photoSelected = photoSelected
//    }
    
    init(){
        photoSelected = PhotoModel(username: "Marco", likes: 32, location: "Toronto, ON", thumbnail: "", profileImage: "")
    }
    
    func loadPhotoDetails() -> PhotoModel? {
        // Returns photo details
        guard let result = photoSelected else {return nil}
        return nil
    }
}

//
//  PhotoModel.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation


struct PhotoModel {
    let username: String
    let likes: Double
    let location: String
    let thumbnail: String
    let profileImage: String
    
    init(username: String,
     likes: Double,
     location: String,
     thumbnail: String,
     profileImage: String ) {
        self.username = username
        self.likes = likes
        self.location = location
        self.thumbnail = thumbnail
        self.profileImage = profileImage
    }
    
}

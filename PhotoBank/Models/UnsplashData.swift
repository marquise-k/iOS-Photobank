//
//  UnsplashData.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation

struct UnsplashData: Codable {
    let results: [Results]?
}

struct Results: Codable{
    let user: User
    let likes: Double
    let urls: Links
}

struct Links: Codable{
    let thumb: String
    let full: String
    let small: String
    let regular: String
}
struct User: Codable{
    let username: String
    let location: String
    let profile_image: ProfileImage
}

struct ProfileImage: Codable{
    let small: String
}


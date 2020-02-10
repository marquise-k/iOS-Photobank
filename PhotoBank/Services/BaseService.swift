//
//  BaseService.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation

//
//
//typealias JsonDictionay = [String : Any]
//
//enum ServiceResponse {
//    case success(response: JsonDictionay)
//    case failure
//    case notConnectedToInternet
//}
//
//enum ResponseStatusCode: Int {
//    case success = 200
//}

protocol APICallManagerDelegate {
    func didUpdateSearch(response: PhotoModel)
}

struct APICallManager {
    let photosByKeywordURL = "https://api.unsplash.com/search/photos?client_id=ec0388bb0dea1a7120b9b02bf7954d94da316914649affc8ee01c7e1ff328a6d"
    
    var delegate: APICallManagerDelegate?
    
    
    func fetchPhotoObjects(keyword: String){
        let urlString = "\(photosByKeywordURL)&query=\(keyword)"
        let photoObjects = performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let response = self.parseJSON(responseData: safeData){
                        self.delegate?.didUpdateSearch(response: response)
                    }
                  
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(responseData: Data) -> PhotoModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(UnsplashData.self, from: responseData)
            
            let username = decodedData.results[0].user.username
            let location = decodedData.results[0].user.location
            let likes = decodedData.results[0].likes
            let profileImage = decodedData.results[0].user.profile_image.small
            let thumbnail = decodedData.results[0].urls.thumb
            
            //let photoDetails = PhotoModel(username: username, likes: likes, location: location, thumbnail: thumbnail, profileImage: profileImage)
            return nil
            
        } catch {
            print (error)
            return nil
        }
    }
}

//
//class BaseService {
//
//    static let sharedService = BaseService()
//
//    private let session: URLSession = {
//        let sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
//            sessionConfig
//    }
//}

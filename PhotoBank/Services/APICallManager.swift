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

//protocol APICallManagerDelegate {
//    func didUpdateSearch(response: PhotoModel)
//}

class APICallManager {
    
    static let shared: APICallManager = APICallManager()
    
    var photoObjects: [PhotoModel] = []
    
    let photosByKeywordURL = "https://api.unsplash.com/search/photos?client_id=ec0388bb0dea1a7120b9b02bf7954d94da316914649affc8ee01c7e1ff328a6d"
    //var query: String = ""
    //var delegate: APICallManagerDelegate?
    
    
    func fetchPhotoObjects(query: String, completionHandler: @escaping ([PhotoModel]) -> Void) {
        let urlString = URL(string: photosByKeywordURL + "&query=" + query)!
        //let photoObjects: [PhotoModel] = performRequest(urlString: urlString)

        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlString, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            if let safeData = data {
                if let responses = try? JSONDecoder().decode(UnsplashData.self, from: safeData){
                    if let apiResults = responses.results{
                        for apiResult in apiResults{
                            let photoItem = PhotoModel(username:  apiResult.user.username, likes: apiResult.likes, location: apiResult.user.location, thumbnail: apiResult.urls.thumb, profileImage:  apiResult.user.profile_image.small)
                            self.photoObjects.append(photoItem)
                    }
                        completionHandler(self.photoObjects)
                    }}}
        })
        task.resume()
    }
}

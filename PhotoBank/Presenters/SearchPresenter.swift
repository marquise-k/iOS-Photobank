//
//  SearchPresenter.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-10.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation

class SearchPresenter {
    
    //initialised our search results to be empty
    var searchResults: [PhotoModel]? = []
    
    init() {
        searchResults = []
//        searchResults = [PhotoModel(username: "hello", likes: 2, location: "", thumbnail: "", profileImage: ""),
//                         PhotoModel(username: "hi", likes: 2, location: "", thumbnail: "", profileImage: "")
    }
}
    
    extension SearchPresenter{
        func getSearchResults(query: String) {
        //Calls API and for each result append to search results initialized on top
            APICallManager().fetchPhotoObjects(query: query, completionHandler: { (objects) in
                self.searchResults = objects
            })
        }
}

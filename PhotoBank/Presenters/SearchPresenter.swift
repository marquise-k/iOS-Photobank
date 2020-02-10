//
//  SearchPresenter.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-10.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation

class SearchPresenter {
    
    var searchResults: [PhotoModel]? = []
    
    init() {
//        searchResults = []
        
        searchResults = [PhotoModel(with: "hello", likes: 2, location: "", thumbnail: "", profileImage: ""),
                         PhotoModel(with: "hi", likes: 2, location: "", thumbnail: "", profileImage: "")
        ]

    }
    
    func getSearchResults() -> [PhotoModel]? {
        guard let results = searchResults else {return nil}
        return nil
        }
    }
    
    
    
    


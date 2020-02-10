//
//  Search.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation
import UIKit

class SearchController: UIViewController {
    
    
    @IBOutlet weak var SearchTextField: UISearchBar!
    @IBOutlet weak var SearchButton: UIButton!
    
    //var APICallManager = APICallManager()
    var searchInput = ""
    
    var presenter = SearchPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchTextField.delegate = self as? UISearchBarDelegate
        presenter.getSearchResults()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        SearchTextField.endEditing(true)
        
        searchInput = SearchTextField.text ?? "Scenery"
        
        search(for:  "")
        //Call presenter to get data in completion handler and then perform segue
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let input = SearchTextField.text {
            //searchInput = APICallManager.fetchPhotoObjects(keyword: input)
        }
        
        
    }
    
    func search(for text: String) {
        // call presenter and search for input text
        //if search is success, then preform segue
        self.performSegue(withIdentifier: "SearchToList", sender: self)
        //if not, show error
        
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "SearchToList" {
            let photoListPage = segue.destination as! PhotoListController
            //photoListPage.searchResults = self.searchQuery
            let photoListPresenter = PhotoListPresenter(with: presenter.searchResults ?? [])
            photoListPage.presenter = photoListPresenter
            
        }
    }
    
}




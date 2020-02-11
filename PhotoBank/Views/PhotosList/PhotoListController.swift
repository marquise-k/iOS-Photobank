//
//  PhotoListController.swift
//  PhotoBank
//
//  Created by Marquise Kamanke on 2020-02-09.
//  Copyright © 2020 Marquise Kamanke. All rights reserved.
//

import Foundation
import UIKit

class PhotoListController: UITableViewController  {
    
    @IBOutlet var PhototableView: UITableView!

    var presenter: PhotoListPresenter?
    var searchQuery: String?
    
    var responseArray: [PhotoModel] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.responseArray = presenter?.photoResultsArray ?? []
        //presenter.getSelectedPhoto()
    }
    

    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoListItemCell", for: indexPath)
        
        let photoItem = responseArray[indexPath.row]
        cell.textLabel?.text = photoItem.username
        return cell
    }
    
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Add function to trigger segue to photo detail controller
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadPhotoItems()
    }
    
    func loadPhotoItems(){
        
        
        //let responseModel = SearchPresenter.getSearchResults()
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           super.prepare(for: segue, sender: sender)
           if segue.identifier == "ListToDetail" {
               let photoDetailsPage = segue.destination as! PhotosDetailsController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let index = indexPath.row
            let photoDetailsPresenter = PhotoDetailsPresenter() //Verify type for selected photo here
            photoDetailsPage.presenter = photoDetailsPresenter
           }
       }
   
}

//extension PhotoListController: APICallManagerDelegate {
//    func didUpdateSearch(response: [PhotoModel]) {
//        DispatchQueue.main.async(execute: {
//            guard let photoList: [PhotoModel] = response as? [PhotoModel], !response.isEmpty else {return}
//            UIApplication.shared.endIgnoringInteractionEvents()
//        })
//        }
//    }
//    
//


//
//  NewsListViewModel.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 09/12/21.
//

protocol NewsListViewModelDelegate: AnyObject {
}

import Foundation

class NewsListViewModel {

    var networkManager: NetworkManager!

    init(viewModelDelegate: NewsListViewModelDelegate ) {
        
    }
    
    func fetchLatestNews() {
    }
}

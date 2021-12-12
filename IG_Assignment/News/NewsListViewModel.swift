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

    var networkManager: NetworkManager = NetworkManager()
    weak var viewModelDelegate: NewsListViewModelDelegate?

    init(viewModelDelegate: NewsListViewModelDelegate ) {
        self.viewModelDelegate = viewModelDelegate
    }
    
    func fetchLatestNews() {
        networkManager.getDashboardContent(page: 0) { response, error in
            print(response as Any)
        }
    }
}

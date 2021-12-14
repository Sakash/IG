//
//  NewListViewController.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 09/12/21.
//

import UIKit

class NewListViewController: UIViewController, NewsListViewModelDelegate {
    
    var viewModel: NewsListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel = NewsListViewModel.init(viewModelDelegate: self, networkManager: NetworkManager())
    }
}

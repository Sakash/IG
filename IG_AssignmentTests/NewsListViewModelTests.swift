//
//  NewsListViewModelTests.swift
//  IG_AssignmentTests
//
//  Created by Sakshi Jain on 14/12/21.
//

import XCTest
@testable import IG_Assignment

class NewsListViewModelTests: XCTestCase {
    
    var viewModel: NewsListViewModel?

    override func setUp() {
        viewModel = NewsListViewModel(viewModelDelegate: nil, networkManager: NetworkManager())
    }
    
    func testFetchLatestNews() {
        viewModel?.fetchLatestNews()
    }
    
    override func tearDown() {
        viewModel = nil
    }
}

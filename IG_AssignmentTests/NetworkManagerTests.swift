//
//  NetworkManagerTests.swift
//  IG_AssignmentTests
//
//  Created by Sakshi Jain on 14/12/21.
//

import XCTest
@testable import IG_Assignment

class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager = NetworkManager()

    override func setUp() {
    }
    
    func testFetchLatestNews() {
        networkManager.getDashboardContent(page: 0) { response, error in
            print(response as Any)
        }
    }
    
    override func tearDown() {
    }
}

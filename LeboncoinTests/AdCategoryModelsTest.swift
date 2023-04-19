//
//  AdsListServiceTest.swift
//  LeboncoinTests
//
//  Created by Achref Ben Tekaya on 19/4/2023.
//

import XCTest

final class AdsListServiceTest: XCTestCase {

    var apiService: AdsListServiceMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiService = AdsListServiceMock()
    }
    
    func testFetchAdsList() {
        let expectation = self.expectation(description: "Fetching ads list")
        
        apiService.fetchAdsList { result in
            switch result {
                case .success(let ads):
                    XCTAssertEqual(ads.count, 3, "Ads list count should be 3")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Error fetching ad list: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchCategories() {
        let expectation = self.expectation(description: "Fetching categories")
        
        apiService.fetchCategories { result in
            switch result {
                case .success(let categories):
                    XCTAssertEqual(categories.count, 12, "Categories list count should be 12")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Error fetching categories: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

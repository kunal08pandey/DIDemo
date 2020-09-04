//
//  DIDemoTests.swift
//  DIDemoTests
//
//  Created by Kunal Pandey on 04/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import XCTest
@testable import DIDemo

class DIDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserViewModel() throws {
      let assembler = TestAssembler()
      let usersViewModel = UsersViewModel(service: assembler.apiService())
      var apiStatus: Bool = false
      var apiError: Error?
      let userExpectation = expectation(description: "users")
      usersViewModel.getUsers { (result) in
        switch result {
          case .success(let status):
            apiStatus = status
          case .failure(let error):
            apiError = error
        }
        userExpectation.fulfill()
      }
      waitForExpectations(timeout: 5.0) { (_) in
        XCTAssertTrue(apiStatus)
        XCTAssertNil(apiError)
      }
    }
  
  func testIfAlbumEmpty() throws {
    let assembler = TestAssembler()
    let albumViewModel = AlbumViewModel(service: assembler.apiService())
    var apiStatus: Bool = false
    var apiError: Error?
    let userExpectation = expectation(description: "album")
    albumViewModel.getAlbums { (result) in
      switch result {
        case .success(let status):
          apiStatus = status
        case .failure(let error):
          apiError = error
      }
      userExpectation.fulfill()
    }
    waitForExpectations(timeout: 2.0) { (_) in
      XCTAssertFalse(apiStatus)
      XCTAssertNil(apiError)
    }
  }
  
  func testIfDataAvailable() throws {
    
  }

    func testUserViewModelPerformance() throws {
        // This is an example of a performance test case.
//     let viewController = UsersViewController(
      measure {
        
      }
    }
  
  func trackPerformance() {
    
  }

}

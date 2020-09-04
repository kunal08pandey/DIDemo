//
//  TestAssembler.swift
//  DIDemoTests
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation
@testable import DIDemo

struct MockNetworking: Networking {
  
  func request(_ request: Requestable, completion: ((Result<Data, Error>) -> Void)?) {
    guard let url = request.path.localUrl else {
      completion?(.failure(AppError.urlError))
      return
    }
    do {
      let data = try Data(contentsOf: url)
      completion?(.success(data))
    } catch {
      completion?(.failure(error))
    }
  }
  
  
}

class TestAssembler: Assembler {
  
  override func networking() -> Networking {
    return MockNetworking()
  }
  
}

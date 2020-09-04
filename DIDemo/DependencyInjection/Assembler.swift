//
//  Assembler.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation

class Assembler {
  
  func usersViewModel() -> UsersViewModel {
    return UsersViewModel(service: apiService())
  }
  
  func albumViewModel() -> AlbumViewModel {
    return AlbumViewModel(service: apiService())
  }
  
  func apiService() -> APIServiceProtocol {
    return APIService(fetcher: fetcher())
  }
  
  func fetcher() -> Fetcher {
    return DataFetcher(networking: networking(), parser: parser())
  }
  
  func networking() -> Networking {
    return HTTPNetworking()
  }
  
  func parser() -> Parser {
    return DataParser()
  }
}

//
//  UsersViewModel.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class UsersViewModel {
  
  let service: APIServiceProtocol
  var users: [Person] = []
  
  init(service: APIServiceProtocol) {
    self.service = service
  }
  
  func numberOfUsers() -> Int {
    return users.count
  }
  
  func model(at indexPath: IndexPath) -> ModelLayer {
    return users[indexPath.item]
  }
  
  func getUsers(completion: @escaping (Result<Bool, Error>) -> Void) {
    service.getUsers { [weak self](result) in
      switch result {
        case .success(let users):
          self?.users = users ?? []
          let status = ((users ?? []).count > 0)
          completion(.success(status))
        case .failure(let error):
          completion(.failure(error))
      }
    }
  }
  
}

extension Person: ModelLayer {
  var title: String {
    return name
  }
  
  var url: String {
    return ""
  }
  
  var image: UIImage? {
    return nil
  }
  
  var subTitle: String {
    return website
  }
}

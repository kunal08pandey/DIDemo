//
//  Path.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation

enum Path: String {
  
  case albums = "https://jsonplaceholder.typicode.com/albums/1/photos"
  case users = "https://jsonplaceholder.typicode.com/users"
  case posts = "https://jsonplaceholder.typicode.com/posts"
  
  var url: URL? {
    return URL(string: self.rawValue, relativeTo: nil)
  }
  
  var localUrl: URL? {
    switch self {
      case .users:
        return Bundle.main.url(forResource: "Users", withExtension: "json")
      case .albums:
        return Bundle.main.url(forResource: "Albums", withExtension: "json")
      case .posts:
        return Bundle.main.url(forResource: "Posts", withExtension: "json")
    }
    
  }
  
  var value: String {
    return self.rawValue
  }
}

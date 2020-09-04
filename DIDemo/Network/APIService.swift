//
//  APIService.swift
//  DIDemo
//
//  Created by Kunal Pandey on 31/08/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
  func getAlbums(completion: @escaping (Result<[Album]?, Error>) -> Void)
  func getUsers(completion:  @escaping (Result<[Person]?, Error>) -> Void)
  func posts(completion:  @escaping (Result<[Article]?, Error>) -> Void)
}

struct AlbumRequest: URLQueryRequest {
  
  var path: Path {
    return .albums
  }
}

struct UserRequest: URLQueryRequest {
  var path: Path {
    return .users
  }
}

struct APIService: APIServiceProtocol {
  
  let fetcher: Fetcher
  
  init(fetcher: Fetcher) {
    self.fetcher = fetcher
  }
  
  func getAlbums(completion: @escaping (Result<[Album]?, Error>) -> Void) {
    let responder = Responder(completion: completion)
    fetcher.fetch(request: AlbumRequest(), responder: responder)
  }
  
  func getUsers(completion:  @escaping (Result<[Person]?, Error>) -> Void) {
    let responder = Responder(completion: completion)
    fetcher.fetch(request: UserRequest(), responder: responder)
  }
  
  func posts(completion:  @escaping (Result<[Article]?, Error>) -> Void) {
    let responder = Responder(completion: completion)
    fetcher.fetch(request: AlbumRequest(), responder: responder)
  }
}

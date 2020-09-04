//
//  Parser.swift
//  DIDemo
//
//  Created by Kunal Pandey on 04/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation

protocol Parser {
  func parse<T: Decodable>(data: Data?, to: T.Type) -> T?
}

struct DataParser: Parser {
  
  func parse<T: Decodable>(data: Data?, to: T.Type) -> T? {
    guard let data = data else { return nil}
    let jsonDecoder = JSONDecoder()
    guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else { return nil }
    return decodedData
  }
  
}

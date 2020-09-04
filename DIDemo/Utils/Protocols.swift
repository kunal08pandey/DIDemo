//
//  Protocols.swift
//  DIDemo
//
//  Created by Kunal Pandey on 04/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

protocol ModelLayer {
  var title: String { get }
  var image: UIImage? { get }
  var url: String { get }
  var subTitle: String { get }
}

extension ModelLayer {
  var subTitle: String {
    return ""
  }
}

protocol DataView {
  associatedtype Item
  func bind(item: Item)
}


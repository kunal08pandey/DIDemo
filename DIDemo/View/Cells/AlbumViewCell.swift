//
//  AlbumViewCell.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
}
extension AlbumViewCell: DataView {
  
  func bind(item: ModelLayer) {
    titleLabel.text = item.title.capitalized
    imageView.setImage(urlString: item.url)
  }
  
  typealias Item = ModelLayer
}

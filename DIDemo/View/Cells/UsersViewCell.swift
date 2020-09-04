//
//  AlbumViewCell.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class UsersViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var avatarImage: UIImageView!
  
}
extension UsersViewCell: DataView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    avatarImage.makeOval()
  }
  
  func bind(item: ModelLayer) {
    titleLabel.text = item.title
    subtitleLabel.text = item.subTitle
    avatarImage.setImage(urlString: item.url, placeHolder: item.title.avatar)
  }
  
  typealias Item = ModelLayer
}

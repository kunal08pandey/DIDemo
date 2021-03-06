//
//  Extension.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit
import Kingfisher

extension UICollectionView {
  
  func dequeue<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: type.identifer, for: indexPath) as! T
  }
  
  func register<T: UICollectionViewCell>(type: T.Type) {
    register(T.nib(), forCellWithReuseIdentifier: T.identifer)
  }
  
}

extension UITableView {
  
  func dequeue<T: UITableViewCell>(type: T.Type) -> T {
    return dequeueReusableCell(withIdentifier: type.identifer) as! T
  }
  
  func register<T: UITableViewCell>(type: T.Type) {
    register(T.nib(), forCellReuseIdentifier: T.identifer)
  }
  
}

extension UIView {
  
  var indentifer: String {
    return "\(self)"
  }
  
  static var identifer: String {
    return "\(self)"
  }
  
  static func nib() -> UINib {
    return UINib(nibName: identifer, bundle: nil)
  }
  
}

extension UIImageView {
  
  func setImage(urlString: String, placeHolder: UIImage? = nil) {
    guard let url = URL(string: urlString) else {
      self.image = placeHolder
      return
    }
    let imageResource = ImageResource(downloadURL: url, cacheKey: urlString)
    kf.setImage(with: imageResource, placeholder: placeHolder)
    addGradient()
  }
  
  func makeOval() {
    layer.cornerRadius = bounds.width / 2
    layer.masksToBounds = true
  }

  func addGradient() {
    layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    let colors: [CGColor] = [UIColor.clear.cgColor, UIColor.init(white: 0, alpha: 0.6).cgColor]
    gradient.colors = colors
    layer.insertSublayer(gradient, at: 0)
  }
  
}

extension String {
  
  var initial: String {
    let words = self.components(separatedBy: " ")
    var initials = ""
    for word in  words {
      initials.append(word.uppercased().first ?? Character(""))
    }
    return initials
  }
  
  var avatar: UIImage? {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    paragraphStyle.lineHeightMultiple = 1.5
    return initial.image(withAttributes: [.foregroundColor: UIColor.white,
                                          .font: UIFont.systemFont(ofSize: 24.0),
        .paragraphStyle: paragraphStyle
      ], size: CGSize(width: 64.0, height: 64.0))
  }
  
  func image(withAttributes attributes: [NSAttributedString.Key: Any]? = nil, size: CGSize? = nil) -> UIImage? {
      let size = size ?? (self as NSString).size(withAttributes: attributes)
      return UIGraphicsImageRenderer(size: size).image { _ in
          (self as NSString).draw(in: CGRect(origin: .zero, size: size),
                                  withAttributes: attributes)
      }
  }
}

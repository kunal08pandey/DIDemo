//
//  ViewController.swift
//  DIDemo
//
//  Created by Kunal Pandey on 31/08/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
  
  let viewModel: AlbumViewModel
  let assember = Assembler()
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    viewModel = assember.albumViewModel()
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  init(viewModel: AlbumViewModel) {
    self.viewModel = assember.albumViewModel()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    self.viewModel = assember.albumViewModel()
    super.init(coder: coder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchAlbums()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.reloadData()
  }
  
  func fetchAlbums() {
    viewModel.getAlbums { [weak self] (result) in
      switch result {
        case .success(_):
          self?.collectionView.reloadData()
        case .failure(_):
          break
      }
    }
  }
  
}

extension AlbumViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfPhotos()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(type: AlbumViewCell.self, indexPath: indexPath)
    cell.bind(item: viewModel.model(at: indexPath))
    return cell
  }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width - 1, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .zero
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}

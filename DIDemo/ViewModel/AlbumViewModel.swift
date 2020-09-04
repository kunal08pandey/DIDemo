//
//  AlbumViewModel.swift
//  DIDemo
//
//  Created by Kunal Pandey on 01/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class AlbumViewModel {
  
  let service: APIServiceProtocol
  var photos: [Album] = []
  
  init(service: APIServiceProtocol) {
    self.service = service
  }
  
  func numberOfPhotos() -> Int {
    return photos.count
  }
  
  func model(at indexPath: IndexPath) -> ModelLayer {
    return photos[indexPath.item]
  }
  
  func getAlbums(completion: @escaping (Result<Bool, Error>) -> Void) {
    service.getAlbums { [weak self](result) in
      switch result {
        case .success(let albums):
          self?.photos = albums ?? []
          let status = ((albums ?? []).count > 0)
          completion(.success(status))
        case .failure(let error):
          completion(.failure(error))
      }
    }
  }
  
}

extension Album: ModelLayer {
  var image: UIImage? {
    return nil
  }
  

  
  
  
  
}

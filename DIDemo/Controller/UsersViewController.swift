//
//  UsersViewController.swift
//  DIDemo
//
//  Created by Kunal Pandey on 31/08/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let viewModel: UsersViewModel
  let assember = Assembler()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    viewModel = assember.usersViewModel()
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  init(viewModel: AlbumViewModel) {
    self.viewModel = assember.usersViewModel()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    self.viewModel = assember.usersViewModel()
    super.init(coder: coder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchAPI()
  }
  
  func fetchAPI() {
    viewModel.getUsers { [weak self] (result) in
      switch result {
        case .success(_):
          self?.tableView.reloadData()
        case .failure(_):
          break
      }
    }
  }
  
}

extension UsersViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfUsers()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(type: UsersViewCell.self)
    cell.bind(item: viewModel.model(at: indexPath))
    return cell
  }
  
  
}



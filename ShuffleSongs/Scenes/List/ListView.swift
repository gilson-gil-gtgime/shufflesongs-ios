//
//  ListView.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

protocol ListViewLogic: class {
  var tableView: UITableView { get }
  var activityIndicator: UIActivityIndicatorView { get }
}

final class ListView: UIView, ListViewLogic {
  public private(set) var activityIndicator: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView(style: .whiteLarge)
    activity.color = .defaultTint
    activity.hidesWhenStopped = true
    return activity
  }()

  public private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
    tableView.allowsSelection = false
    return tableView
  }()

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(frame: .zero)
    setup()
  }

  // MARK: - Setup
  private func setup() {
    addSubviews()
    addConstraints()
  }

  private func addSubviews() {
    addSubview(activityIndicator)
    addSubview(tableView)
  }

  private func addConstraints() {
    constrain(self, activityIndicator, tableView) { view, activityIndicator, tableView in
      activityIndicator.center == view.center
      tableView.edges == view.edges
    }
  }
}

//
//  RootViewController.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright (c) 2019 Gilson Gil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

final class RootViewController: UINavigationController {
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Setup

  private func setup() {
    viewControllers = [ListViewController()]
    view.backgroundColor = .main
    navigationBar.barTintColor = .navigationBar
    navigationBar.tintColor = .defaultTint
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.defaultTint]
  }
}
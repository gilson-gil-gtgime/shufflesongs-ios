//
//  Colors.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
    self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
  }

  convenience init(_ white: CGFloat) {
    self.init(white: white / 255, alpha: 1)
  }

  static var main: UIColor {
    return UIColor(53, 39, 54)
  }

  static var navigationBar: UIColor {
    return UIColor(63, 45, 59)
  }

  static var defaultTint: UIColor {
    return UIColor(255)
  }

  static var title: UIColor {
    return UIColor(207, 111, 119)
  }

  static var subtitle: UIColor {
    return UIColor(255)
  }
}

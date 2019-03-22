//
//  String+Localized.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }
}

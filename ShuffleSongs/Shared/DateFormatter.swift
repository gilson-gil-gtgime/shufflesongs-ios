//
//  DateFormatter.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

extension DateFormatter {
  static var api: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    return dateFormatter
  }
}

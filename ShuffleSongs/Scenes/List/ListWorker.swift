//
//  ListWorker.swift
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

final class ListWorker {
  func fetchList(artists: [Artist], completion: @escaping (() throws -> [Track]) -> Void) {
    var artistsIds = artists.reduce("") { $0 + String(describing: $1.identifier) + "," }
    artistsIds = String(artistsIds.prefix(artistsIds.count - 1))

    API.getTracksList(artistsIds: artistsIds, completion: completion)
  }

  func shuffle(list: [Track]) -> [Track] {
    var shuffled: [Track] = []
    var original = list

    while !original.isEmpty {
      let index: Int
      // if there is at least one track
      if let latest = shuffled.last {
        // the next should not be from the same artist
        let filtered = original.filter { $0.artistId != latest.artistId }
        // making sure the remaining tracks do not belong to the latest artist
        if !filtered.isEmpty {
          let filteredIndex = Int.random(in: 0..<filtered.count)
          index = original.firstIndex(where: { $0.identifier == filtered[filteredIndex].identifier }) ?? 0
        } else {
          // but if there is the only option, restart from scratch
          original = list
          shuffled = []
          continue
        }
      } else {
        index = Int.random(in: 0..<original.count)
      }
      // remove from original and append to shuffled
      let next = original.remove(at: index)
      shuffled.append(next)
    }
    return shuffled
  }
}

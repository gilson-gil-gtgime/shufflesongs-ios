//
//  DataContainer.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

enum WrapperType: String, Decodable {
  case track, artist
}

struct DataContainer: Decodable {
  let count: Int
  let results: [Track]

  enum CodingKeys: String, CodingKey {
    case count = "resultCount"
    case results
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    count = try container.decode(Int.self, forKey: .count)
    var results = try container.nestedUnkeyedContainer(forKey: .results)
    var tracks: [Track] = []

    while !results.isAtEnd {
      do {
        if let track = try? results.decode(Track.self) {
          tracks.append(track)
        } else {
          _ = try? results.decode(Artist.self)
        }
      }
    }
    self.results = tracks
  }
}

//
//  Track.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct Track: Decodable {
  let releaseDate: Date
  let artistId: Int
  let timeMillis: Int
  let collectionName: String
  let artistName: String
  let identifier: Int
  let explicitness: String
  let censoredName: String
  let collectionId: Int
  let name: String
  let country: String
  let genre: String
  let artworkUrl: String

  enum CodingKeys: String, CodingKey {
    case releaseDate, artistId, collectionName, artistName, collectionId, country, artworkUrl
    case timeMillis = "trackTimeMillis"
    case identifier = "id"
    case explicitness = "trackExplicitness"
    case censoredName = "trackCensoredName"
    case name = "trackName"
    case genre = "primaryGenreName"
  }

  init(identifier: Int, artistId: Int, name: String) {
    self.identifier = identifier
    self.name = name
    self.artistId = artistId
    releaseDate = Date()
    timeMillis = 0
    collectionName = ""
    explicitness = ""
    censoredName = ""
    collectionId = 0
    country = ""
    genre = ""
    artworkUrl = ""
    artistName = ""
  }
}

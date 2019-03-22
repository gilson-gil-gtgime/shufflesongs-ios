//
//  Artist.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

struct Artist: Decodable {
  let name: String
  let identifier: Int

  enum CodingKeys: String, CodingKey {
    case name = "artistName"
    case identifier = "id"
  }

  static var myArtists: [Artist] {
    let johnDollar = Artist(name: "John Dollar", identifier: 909253)
    let charlie = Artist(name: "Charlie and the Chewie Humans", identifier: 1171421960)
    let bloco = Artist(name: "Bloco TótiOQue", identifier: 358714030)
    let arianne = Artist(name: "MC Arianne", identifier: 1419227)
    let decimais = Artist(name: "Decimais MC’s", identifier: 264111789)

    return [johnDollar, charlie, bloco, arianne, decimais]
  }
}

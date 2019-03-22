//
//  API.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import Foundation

enum APIError: LocalizedError {
  case custom(String)

  var errorDescription: String? {
    switch self {
    case .custom(let message):
      return message
    }
  }
}

struct API {
  private static var baseUrlString: String {
    return "https://us-central1-tw-exercicio-mobile.cloudfunctions.net"
  }

  public static var baseUrl: URL {
    guard let url = URL(string: baseUrlString) else { fatalError("invalid base url") }
    return url
  }

  enum Endpoints: String {
    case lookup = "/lookup"
  }

  static func getTracksList(artistsIds: String, completion: @escaping (() throws -> [Track]) -> Void) {
    let method = Method.get
    let path = Endpoints.lookup.rawValue
    let parameters: Parameters = ["id": artistsIds, "limit": 5]
    HTTPService.request(method: method, baseUrl: baseUrl, path: path, parameters: parameters) { callback in
      do {
        let data = try callback()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.api)
        let list = try decoder.decode(DataContainer.self, from: data).results
        completion { list }
      } catch {
        completion { throw error }
      }
    }
  }
}

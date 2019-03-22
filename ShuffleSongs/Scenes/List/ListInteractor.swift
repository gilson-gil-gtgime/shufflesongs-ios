//
//  ListInteractor.swift
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

protocol ListBusinessLogic {
  func fetchList(request: List.SongsList.Request)
}

protocol ListDataStore {
  var list: [Track] { get set }
}

final class ListInteractor: ListBusinessLogic, ListDataStore {
  var presenter: ListPresentationLogic?
  lazy var worker: ListWorker = { ListWorker() }()
  var artists: [Artist] = Artist.myArtists
  var list: [Track] = []

  // MARK: - Fetch List

  func fetchList(request: List.SongsList.Request) {
    worker.fetchList(artists: artists) { [weak self] callback in
      do {
        let list = try callback()
        let response = List.SongsList.Response(list: list)
        self?.presenter?.presentList(response: response)
      } catch {
        print(error)
      }
    }
  }
}

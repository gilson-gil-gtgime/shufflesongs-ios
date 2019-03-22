//
//  ListTrackCell.swift
//  ShuffleSongs
//
//  Created by Gilson Gil on 22/03/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

import Cartography

protocol ListTrackCellLogic: class {
  func update(track: List.DisplayedTrack)
}

final class ListTrackCell: UITableViewCell {
  private let artworkImageView: URLImageView = {
    let imageView = URLImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private let trackLabel: UILabel = {
    let label = UILabel()
    label.textColor = .title
    return label
  }()

  private let infoLabel: UILabel = {
    let label = UILabel()
    label.textColor = .subtitle
    label.numberOfLines = 2
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(style: .default, reuseIdentifier: ListTrackCell.reuseIdentifier)
    setup()
  }

  // MARK: - Setup

  private func setup() {
    addSubviews()
    addConstraints()

    backgroundColor = .clear
  }

  private func addSubviews() {
    addSubview(artworkImageView)
    addSubview(trackLabel)
    addSubview(infoLabel)
  }

  private func addConstraints() {
    let margin: CGFloat = 12
    let artworkSize: CGFloat = 60
    constrain(self, artworkImageView, trackLabel, infoLabel) { view, artworkImageView, trackLabel, infoLabel in
      artworkImageView.top == view.top + margin
      artworkImageView.left == view.left + margin
      artworkImageView.bottom == view.bottom - margin
      artworkImageView.width == artworkSize
      artworkImageView.height == artworkSize

      trackLabel.left == artworkImageView.right + margin
      trackLabel.bottom == artworkImageView.centerY - 2
      trackLabel.right == view.right - margin

      infoLabel.top == artworkImageView.centerY + 2
      infoLabel.left == trackLabel.left
      infoLabel.right == trackLabel.right
    }
  }
}

// MARK: - ListTrackCell Logic
extension ListTrackCell: ListTrackCellLogic {
  func update(track: List.DisplayedTrack) {
    trackLabel.text = track.name
    infoLabel.text = track.info
    artworkImageView.imageUrl = track.artworkUrl
  }
}

// MARK: - Reuse Identifiable
extension ListTrackCell: ReuseIdentifiable {}

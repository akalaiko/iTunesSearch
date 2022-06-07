//
//  MusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Tim on 07.06.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct MusicCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class MusicCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> MusicCellModel {
        return MusicCellModel(title: model.trackName,
                                 subtitle: model.artistName,
                                 rating: model.collectionName)
    }
}

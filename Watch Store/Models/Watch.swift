//
//  Watch.swift
//  Watch Store
//
//  Created by Eli Hartnett on 8/21/22.
//

import Foundation

struct Watch: Identifiable {
    let id = UUID()
    let watchCase: WatchCase
    let image: String
    let bandType: WatchBandType
    var isFavorite = false
}

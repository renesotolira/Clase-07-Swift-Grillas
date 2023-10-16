//
//  Game.swift
//  05 ListGames
//
//  Created by Rene SL on 19/05/23.
//

import Foundation

struct Game : Identifiable{
    let uuid = UUID()
    let id: Int
    let image: String
    let name: String
    let console: String
    let price: Float
}

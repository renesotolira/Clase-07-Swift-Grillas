//
//  FactoryGames.swift
//  05 ListGames
//
//  Created by Rene SL on 19/05/23.
//

import Foundation

struct GamesViewModel{
    
    func dummyData() -> [Game] {
        
        var games: [Game] = [
            Game(id: 1, image: "mario", name: "Mario Bros Galaxy", console: "Nintendo", price: 1200.00),
            
            Game(id: 1, image: "mario", name: "Wario Land", console: "Nintendo", price: 1200.00),
            
            
            Game(id: 2, image: "zelda", name: "The Legend of Zelda Tear of Kingdom", console: "Nintendo", price: 1600.00),
            
            Game(id: 3, image: "arise", name: "Tales of Arise", console: "Playstation 4", price: 2500.00),
            
            Game(id: 4, image: "halo", name: "Halo", console: "Xbox", price: 130.00),
            
            Game(id: 5, image: "sackboy", name: "Sackboy", console: "PS4", price: 130.00)
            
           
        ]
        
        for x in 6 ... 500 {
            games.append(Game(id: x, image: "sackboy", name: "Juego #\(x)", console: "PS4", price: (130.00 + Float(x) )))
        }
        
        return games
    }
}

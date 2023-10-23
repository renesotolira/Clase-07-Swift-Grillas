//
//  AdaptativeGridView.swift
//  ListasModelos
//
//  Created by Rene SL on 23/10/23.
//

import SwiftUI

struct AdaptiveGridView: View {
    let gamesViewModel = GamesViewModel().dummyData()
    
  
    let columns = [
        GridItem(.adaptive(minimum: 50), spacing: 10)
    ]
    var body: some View {
        ScrollView(){
            Text("Cuantas columnas posibles")
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(gamesViewModel, id: \.self.uuid){
                    game in
                    
                    Text(game.name)
                }
            }
        }
    }
}

struct AdaptiveGridView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveGridView()
    }
}

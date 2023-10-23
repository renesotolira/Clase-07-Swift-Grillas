//
//  FixedGridView.swift
//  ListasModelos
//
//  Created by Rene SL on 23/10/23.
//

import SwiftUI

struct FixedGridView: View {
    
    let gamesViewModel = GamesViewModel().dummyData()
    
    //2 columnas una de 150 ancho y otro de 50
    let columns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(50))
    ]
    var body: some View {
        ScrollView(){
            Text("2 columnas de ancho fijo")
            LazyVGrid(columns: columns){
                ForEach(gamesViewModel, id: \.self.uuid){
                    game in
                    
                    Text(game.name)
                }
            }
        }
    }
}

struct FixedGridView_Previews: PreviewProvider {
    static var previews: some View {
        FixedGridView()
    }
}

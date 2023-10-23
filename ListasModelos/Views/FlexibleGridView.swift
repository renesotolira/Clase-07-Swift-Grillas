//
//  FlexibleGridView.swift
//  ListasModelos
//
//  Created by Rene SL on 23/10/23.
//

import SwiftUI

struct FlexibleGridView: View {
    let gamesViewModel = GamesViewModel().dummyData()
    
    //2 columnas de ancho flexible
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView(){
            Text("2 columnas de ancho flexible")
            LazyVGrid(columns: columns){
                ForEach(gamesViewModel, id: \.self.uuid){
                    game in
                    
                    Text(game.name)
                }
            }
        }
    }

}

struct FlexibleGridView_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleGridView()
    }
}

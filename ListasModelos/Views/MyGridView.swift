//
//  MyGridView.swift
//  ListasModelos
//
//  Created by Rene SL on 16/10/23.
//

import SwiftUI

struct MyGridView: View {
    
    @State var gamesViewModel = GamesViewModel().dummyData()
    

    @State var gameName:String = ""
    
    //spacing horizontal
    var columns = Array(repeating: GridItem(.flexible(),spacing: 5), count: 2)
    
    func search() -> [Game]{
        
        if !gameName.isEmpty{
            return gamesViewModel.filter {
                $0.name.lowercased().contains( gameName.lowercased())
                
            }
        }else{
            return gamesViewModel
        }
            
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                SearchView(gameName: $gameName)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        //spacing vertical
                        ForEach(search() , id: \.self.uuid) {
                            
                            game in
                            
                            GridElementView(image: game.image, name: game.name, console: game.console, price: String(game.price), geometry: geometry)
                        }
                    }
                }
            }
        }
        
    }
}

struct MyGridView_Previews: PreviewProvider {
    static var previews: some View {
        MyGridView()
    }
}

//
//  ContentView.swift
//  ListasModelos
//
//  Created by Rene SL on 09/10/23.
//

import SwiftUI

struct MyListView: View {
    
    @State var gamesViewModel = GamesViewModel().dummyData()
    

    @State var gameName:String = ""
    
    func addGame(){
        gamesViewModel.append(Game(id: 11, image: "zelda", name: "Zelda", console: "SWITCH", price: 1280.00)
        )
    }
    
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
        VStack(){
            
           SearchView(gameName: $gameName)
            
            /*List +ForEach*/
            List() {
                ForEach( search(), id: \.self.uuid) { game in
                    CardView(image: game.image, name: game.name, console: game.console, price: String(game.price))
                        .padding(.trailing)
                        .background(Color("cardColor"))
                        .cornerRadius(15)
                        .padding(4)
                        .listRowInsets(EdgeInsets())
                    
                }.onDelete { (indexSet) in
                    self.gamesViewModel.remove(atOffsets: indexSet)
                    //addGame()
                }
            }.listStyle(PlainListStyle())
            
            
            /*Ejemplo solo List
             List(gamesViewModel , id: \.self.uuid) { game in
             CardView(image: game.image, name: game.name, console: game.console, price: String(game.price))
             .padding(.trailing)
             .background(Color("cardColor"))
             .cornerRadius(15)
             .padding(4)
             
             
             }
             */
            
            /*ForEach únicamente
             
             ScrollView(.vertical){
             VStack(alignment: .center){
             ForEach(gamesViewModel) { game in
             // LazyVStack(){
             CardView(image: game.image, name: game.name, console: game.console, price: String(game.price))
             .padding(.trailing)
             .background(Color("cardColor"))
             .cornerRadius(15)
             .padding(4)
             // }
             
             }
             }
             
             }
             */
            Spacer()
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}

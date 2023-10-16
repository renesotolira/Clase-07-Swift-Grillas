//
//  CardView.swift
//  05 ListGames
//
//  Created by Rene SL on 19/05/23.
//

import SwiftUI

struct CardView: View {
    
    var image : String
    var name : String
    var console : String
    var price : String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 100)
                
                .padding(.horizontal)
            
            
            
            VStack(alignment: .leading, spacing: 0 ){
                
                Text(name)
                    .foregroundColor(Color.purple)
                    .font(.headline)
                    .padding(.bottom)
                
                HStack{
                    Text(console)
                        .font(.caption)
                    
                    Spacer()
                    
                    Text(price + " MXN")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                HStack(){
                    
                    Spacer()
                    
                    Button(action: {
                        print("hola")
                    }, label:{
                        Text("Comprar")
                            .padding(.horizontal)
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(4)
                            .padding(.vertical)
                    })
                }
            }
        }.onAppear(){
            print("mostando row")
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "mario", name: "Mario Bros F", console: "Nintendo Switch", price: "1200.00")
    }
}

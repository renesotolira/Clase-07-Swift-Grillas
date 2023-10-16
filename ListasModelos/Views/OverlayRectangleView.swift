//
//  OverlayRectangleView.swift
//  ListasModelos
//
//  Created by Rene SL on 16/10/23.
//

import SwiftUI

struct OverlayRectangleView: View {
    //$ , consola  green, red
    var background: Color = Color.black
    var foreground: Color = Color.white
    var icon: String
    var text: String
    var geometry : GeometryProxy
    
    var body: some View {
        Rectangle()
            .foregroundColor(background)
            .opacity(0.53)
            .frame(width: (geometry.size.width / 4) - 15, height: 34, alignment: .trailing)
            .overlay(
                HStack( ){
                    Image(systemName: icon)
                        .font(.system(.caption,design: .rounded))
                        .foregroundColor(foreground)
                    
                    Text(text)
                        .font(.system(.caption,design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(foreground)
                }
                
            )
    }
}

struct OverlayRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            OverlayRectangleView(background: Color.green , foreground: Color.black ,icon: "dollarsign",  text: "texto", geometry: geometry)
        }
    }
}

//
//  GridElementView.swift
//  ListasModelos
//
//  Created by Rene SL on 16/10/23.
//

import SwiftUI

struct GridElementView: View {
    
    var image : String
    var name : String
    var console : String
    var price : String
    var geometry : GeometryProxy
    
    
    func setMaxHeight(geometry: GeometryProxy) -> CGFloat{
      
        let isLandscape = UIDevice.current.orientation.isLandscape
        
        let isPhone = UIDevice.current.userInterfaceIdiom == .phone
        
        let isIpad : Bool = UIDevice.current.userInterfaceIdiom == .pad
        
        
        var height : CGFloat = 190
        
        let qtyByColumn : CGFloat = isIpad ? 3 : 2
        
        height = (geometry.size.height - 100) / qtyByColumn
        
        if !isLandscape && (isPhone || height < 190) {
            height = 178.5
        }else if isLandscape && (isPhone && height < 100) {
            height = 150
        }
        else if isLandscape && (isIpad && height < 100) {
            height = 178.5
        }
       
        return height
    }
    
    
    func setMaxWidth(geometry: GeometryProxy) -> CGFloat{
        let qtyByRow : CGFloat = 2
        var width = (geometry.size.width - 48) / qtyByRow
        if width < 100 {
            width = 100
        }
        return width
    }
    
    var body: some View {
        VStack(spacing: 0){
            Image(image)
                .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: setMaxWidth(geometry: geometry), height: setMaxHeight(geometry: geometry))
            .clipShape(Rectangle())
            .cornerRadius(8)
            .opacity(1.0)
            .font(.system(size:80))
            .foregroundColor(.green)
            .shadow(color:.gray,radius: 10,x:0,y:10)
            .blur(radius: 2.5)
            //overlay nombre parte inferior
            .overlay(
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .opacity(0.3)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.75)
                            .frame(height: 42)
                            
                            .overlay(
                                Text(name)
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .truncationMode(.middle)
                                    .padding(.horizontal,8)
                                    .padding(.bottom,2)
                                    .opacity(1)
                            )
                        
                        ,alignment:.bottom
                    ).cornerRadius(8)
                
            )
            
            //overlay parte superior derecha
            .overlay(
                OverlayRectangleView(background: Color.green , foreground: Color.black ,icon: "dollarsign",  text: price, geometry: geometry)
                ,alignment:.topTrailing
            ).cornerRadius(10)
            
            //overlay arriba izquierdo
            .overlay(
                OverlayRectangleView(background: Color.red , foreground: Color.white  , icon: "gamecontroller.fill",  text: console, geometry: geometry)
                ,alignment:.topLeading
            )
        }
    }
}

struct GridElementView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            GridElementView(image: "mario", name: "Mario", console: "consola", price: "1200", geometry: geometry)
        }
    }
}

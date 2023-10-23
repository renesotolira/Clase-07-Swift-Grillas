//
//  GeometryView.swift
//  ListasModelos
//
//  Created by Rene SL on 23/10/23.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                
                Image("mario")
                    .resizable()
                    .frame(
                        width: geometry.size.width / 2
                        , height: 150
                    )
             
                
                
                Text("Mario Odissey")
                    .frame(
                        minHeight: 50, idealHeight: 100,
                        maxHeight: geometry.size.height / 3
                    )
                    .background(Color.orange)
                
            }
        }
       
    }
}

struct GeometryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView()
    }
}

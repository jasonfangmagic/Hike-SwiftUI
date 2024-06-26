//
//  ContentView.swift
//  Hike SwiftUI
//
//  Created by Jason Fang on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    
    let hikes = [
    Hike(name: "Salmonberry Trail", photo: "sal", miles: 6),
    Hike(name: "Tom, Dick Mountain Tom, Dick Mountain", photo: "tom", miles: 5.8),
    Hike(name: "Tamanawas Falls", photo: "tam", miles: 5)
    ]
    
    var body: some View {
        NavigationStack{
            List(hikes) { hike in
                NavigationLink(value: hike){ HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self){ hike in HikeDetailScreen(hike: hike)
                }
                                       
        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    
    let hike: Hike
    
    var body: some View {
        HStack(alignment: .top) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
                .clipShape(RoundedRectangle(cornerRadius: 25,style: .continuous))
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted())")
            }
            
        }
    }
}

//
//  ContentView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var holeArray: [Position] = []
    
    var body: some View {
        
        ScrollView([.horizontal, .vertical]) {
            ZStack {
                ForEach(holeArray, id: \.self) { hole in
                    BlastHoleView(blastholeNumber: hole.num, top: hole.top, leading: hole.leading, bottom: hole.bottom, trailing: hole.trailing)
                }
            }
            .onAppear{
                holeArray = ModelHole().createHoleArray(row: 6, colum: 6)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

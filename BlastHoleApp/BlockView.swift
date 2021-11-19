//
//  BlockView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 20.11.2021.
//

import SwiftUI

struct BlockView: View {
    
    @State var holeArray: [Position] = []
    
    var body: some View {
        
        ScrollView([.horizontal, .vertical]) {
            ZStack {
                ForEach(holeArray, id: \.self) { hole in
                    HoleView(holeNumber: hole.num, top: hole.top, leading: hole.leading, bottom: hole.bottom, trailing: hole.trailing)
                }
            }
            .onAppear{
                holeArray = BlockTemplate().createHoleArray(row: 6, colum: 9, distance: 70)
                
            }
        }
    }
    private func recordProgress() {}
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView()
    }
}

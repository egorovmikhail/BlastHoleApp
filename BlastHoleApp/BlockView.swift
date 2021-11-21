//
//  BlockView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 20.11.2021.
//

import SwiftUI

struct BlockView: View {
    
    @ObservedObject var isStart: StartProgress
    
    @State var holeArray: [Position] = []
    
    var body: some View {
        
        ScrollView([.horizontal, .vertical]) {
            ZStack {
                ForEach(holeArray, id: \.self) { hole in
                    HoleView(holeNumber: hole.num, top: hole.top, leading: hole.leading, bottom: hole.bottom, trailing: hole.trailing, timeDelay: Double(hole.num), isStart: isStart)
                }
            }
            .onAppear{
                holeArray = BlockTemplate().createHoleArray(row: 6, colum: 9, distance: 70)
                
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(VStack {
            Divider()
            Spacer()
        })
        .toolbar {
            ToolbarItemGroup {
                Button(action: {
                    print("Button pressed")
                }) {
                    Text("Save")
                }

                Button(action: {
                    isStart.status.toggle()
                    isStart.status.toggle()
                }) {
                    
                    Text("Test")
                }
                Spacer()
            }
        }
    }
    private func recordProgress() {}
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(isStart: StartProgress())
    }
}

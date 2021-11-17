//
//  BlastHoleView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import SwiftUI

struct BlastHoleView: View {
    
    @State var isDragging = false
    @State var isRemoveView = false
    @State var backgroundColor: Color = .gray
    @State var position = CGSize.zero
    
    var holeNumber: Int = 0
    var top: CGFloat
    var leading: CGFloat
    var bottom: CGFloat
    var trailing: CGFloat
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.position = value.translation
//                print(position)
                self.isDragging = true }
            .onEnded { value in
                self.position = .zero
                self.isDragging = false
                self.isRemoveView = true}
    }
    
    var tap: some Gesture {
        TapGesture()
            .onEnded({
                changeColor()
            })
    }
    
    var body: some View {
        ZStack(){
            Circle()
                .fill(backgroundColor)
                .frame(width: 30.0, height: 30.0)
            Text("\(holeNumber)" )
        }
        .padding(EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
        .offset(x: position.width, y: position.height)
        .gesture(drag)
        .gesture(tap)
    }
    
    init(blastholeNumber: Int = 0, top: CGFloat = 50, leading: CGFloat = 50, bottom: CGFloat = 50, trailing: CGFloat = 50) {
        self.holeNumber = blastholeNumber
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    
    
    mutating func holeNumber(num: Int) -> Void {
        holeNumber = num
    }
    
    private func changeColor() {
        backgroundColor == .gray ? (backgroundColor = .red) : (backgroundColor = .gray)
    }
}

struct BlastHoleView_Previews: PreviewProvider {
    static var previews: some View {
        BlastHoleView()
    }
}


//
//  HoleView.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import SwiftUI

struct HoleView: View {
    
    @ObservedObject var isStart: StartProgress
   
    @State var isDragging = false
    @State var isRemoveView = false
    @State var backgroundColor: Color = .gray
    @State var position = CGSize.zero
    
    var number: Int
    var top: CGFloat
    var leading: CGFloat
    var bottom: CGFloat
    var trailing: CGFloat
    var tDelay: Double
    

    init(holeNumber: Int = 0, top: CGFloat = 50, leading: CGFloat = 50, bottom: CGFloat = 50, trailing: CGFloat = 50, timeDelay: Double = 5, isStart: StartProgress) {
        self.number = holeNumber
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.tDelay = timeDelay
        self.isStart = isStart
    }
   
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.position = value.translation
                print(position)
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
                print(number)
            })
    }
    
    var body: some View {
        
        ZStack(){
            Circle()
                .fill(backgroundColor)
                .frame(width: 30.0, height: 30.0)
            Text("\(number)")
            
        }
        .padding(EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
        .offset(x: position.width, y: position.height)
        .gesture(drag)
        .gesture(tap)

        .onReceive(self.isStart.$status) { stat in
            if stat {
                Timer.scheduledTimer(withTimeInterval: 0.5+(tDelay*0.04), repeats: false, block: {_ in changeColor()})
//                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(500+(tDelay*60)))) {changeColor()}
//                Timer.publish(every: 0.5+(tDelay*0.4), on: .main, in: .common).autoconnect()
            }
        }
    }

    private func changeColor() {
        backgroundColor == .gray ? (backgroundColor = .red) : (backgroundColor = .gray)
    }
}

struct HoleView_Previews: PreviewProvider {
    static var previews: some View {
        HoleView( isStart: StartProgress())
    }
}


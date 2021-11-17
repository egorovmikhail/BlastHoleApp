//
//  ModelHole.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import Foundation

struct ModelHole {
    private var position: [Position] = []
//    {
//        return createHoleArray(row: 3, colum: 3)
//    }
    
    public func createHoleArray( row: Int = 6, colum: Int = 3 ) -> [Position] {
        var num: Int = 0
        var top: CGFloat = 0
        var leading: CGFloat = 0
        var bottom: CGFloat = 100.0 * CGFloat(row + 1)
        var trailing: CGFloat = 0
        
        var array = [Position]()
        
        for _ in 0..<row {
            top += 100
            bottom -= 100
            for _ in 0..<colum {
                num += 1
                leading == CGFloat(colum * 100) ? (leading = 100.0) : (leading += 100.0)
                trailing <= 100.0 ? (trailing = CGFloat(100 * colum)) : (trailing -= 100.0)
                array += [Position(num: num, top: top, leading: leading, bottom: bottom, trailing: trailing)]
            }
        }
        return array
    }
}

struct Position: Hashable {
    var num: Int = 0
    var top: CGFloat = 100
    var leading: CGFloat = 100
    var bottom: CGFloat = 300
    var trailing: CGFloat = 300
}


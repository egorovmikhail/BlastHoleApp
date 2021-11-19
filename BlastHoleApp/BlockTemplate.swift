//
//  BlockTemplate.swift
//  BlastHoleApp
//
//  Created by Михаил Егоров on 08.11.2021.
//

import Foundation

struct BlockTemplate {
    
    public func createHoleArray( row: Int = 3, colum: Int = 3, distance: CGFloat = 100) -> [Position] {
        var num: Int = 0
        var top: CGFloat = 0
        var leading: CGFloat = 0
        var bottom: CGFloat = distance * CGFloat(row + 1)
        var trailing: CGFloat = 0
        
        var array = [Position]()
        
        for _ in 0..<row {
            top += distance
            bottom -= distance
            for _ in 0..<colum {
                num += 1
                leading == (CGFloat(colum) * distance) ?
                (leading = distance) : (leading += distance)
                
                trailing <= distance ?
                (trailing = (distance * CGFloat(colum))) : (trailing -= distance)
                
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
    var bottom: CGFloat = 100
    var trailing: CGFloat = 100
}


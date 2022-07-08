//
//  String.swift
//  ViitageEX
//
//  Created by LaurenceMBP2 on 2022/7/4.
//

import Foundation

extension String {
    
    func toDouble() -> Double {
        let string = self as NSString
        let convertedToDouble = string.doubleValue
        return convertedToDouble
    }
    
    func toDoubleAndRound(to decimal:Int) -> String {
        let string = self as NSString
        let convertedToDouble = string.doubleValue
        return convertedToDouble.asDoubleString(roundTo: decimal)
    }
    
}

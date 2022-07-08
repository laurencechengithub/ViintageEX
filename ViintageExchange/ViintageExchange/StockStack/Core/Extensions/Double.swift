//
//  Double.swift
//  ViitageEX
//
//  Created by LaurenceMBP2 on 2022/7/4.
//

import Foundation

extension Double {
    
    /// Convert Double into a Currency with 2-6 decimals places
    /// ```
    /// convert 1234.56  => $1,234.56
    /// convert 12.3456  => $12.3456
    /// convert 0.123456 => $0.123456
    /// ```
    private var currencyFormatterSix: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true //the commers of doller
        formatter.numberStyle = .currency
//        formatter.locale            = .current  // defualt
//        formatter.currencyCode      = "usd"     // change currency
//        formatter.currencySymbol    = "#"       // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Convert Double into a Currency with 2-6 decimals places
    /// ```
    /// convert 1234.56  => $1,234.56
    /// convert 12.3456  => $12.3456
    /// convert 0.123456 => $0.123456
    /// ```
    func asCurrencyStringWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatterSix.string(from: number) ?? "$0.00"
        
        
    }
    
    /// Convert `Double` to `Decimal`, rounding it to `scale` decimal places.
    ///
    /// - Parameters:
    ///   - scale: How many decimal places to round to. Defaults to `0`.
    ///   - mode:  The preferred rounding mode. Defaults to `.plain`.
    /// - Returns: The rounded `Decimal` value.
    func roundDecimal(To scale: Int = 2, mode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        
        var value = Decimal(self)
        var result = Decimal()
         NSDecimalRound(&result, &value, scale, mode)
         return result
        
    }
    
    
    func asDoubleString(roundTo fraction:Int) -> String {
        return String(format: "%."+"\(fraction)"+"f", self)
    }
    

    /// Convert Double into String representation with percent symbol
    ///
    func asPercentString() -> String {
        return asDoubleString(roundTo: 2) + "%"
    }
    
    
    
    
    
    
}


extension Double {
    
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatterTwo: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // <- default value
        //formatter.currencyCode = "usd" // <- change currency
        //formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatterTwo.string(from: number) ?? "$0.00"
    }
    
    
}

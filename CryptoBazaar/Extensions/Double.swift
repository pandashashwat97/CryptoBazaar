//
//  Double.swift
//  CryptoBazaar
//
//  Created by Shashwat Panda on 26/06/24.
//

import Foundation

extension Double {
    private var currencyFormatter2Decimals: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    /// converts a Double into a Currency with 2 decimal places
    /// ```
    ///  Converts 1234.3456 to $1,234.34
    ///  ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2Decimals.string(from: number) ?? "$0.00"
    }
    /// converts a default Double value into a Number with 2 decimal places
    /// ```
    ///  Converts 1.234 to "1.23"
    ///  ```
    func asNumberStringWithDecimals() -> String {
        return String(format: "%.2f", self)
    }
}

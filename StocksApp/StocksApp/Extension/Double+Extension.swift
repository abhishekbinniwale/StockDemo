//
//  Double+Extension.swift
//  StocksApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 08/03/22.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Rafael Veronez Dias on 20/01/23.
//

import Foundation


class TaxesCalculator {
    static let shared = TaxesCalculator()
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double  {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax / 100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof / 100
    }
    
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
    func convertToDouble(value: String) -> Double? {
        formatter.numberStyle = .none
        return formatter.number(from: value)?.doubleValue
    }
    
    func getFormattedValue(of value: Double, with currency: String ) -> String? {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        
        return formatter.string(for: value)
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        
        if (usingCreditCard) {
            finalValue += iofValue
        }
        
        return finalValue * dolar
    }
}

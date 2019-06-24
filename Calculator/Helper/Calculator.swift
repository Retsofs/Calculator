//
//  Calculator.swift
//  Calculator
//
//  Created by Alexandr on 09/06/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation
class CalculationError: Error {
    private let errorText: String
    var localizedDescription: String {
        return errorText
    }
    init(errorText: String) {
        self.errorText = errorText
    }
}
protocol Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?)
}

class SumCalculator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?) {
        let result = a + b
        return (result, nil)
    }
    //операция сложения
}

class MinusCalculator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?) {
        let result = a - b
        return (result, nil)
    }
    //операция вычитания
}

class MultiplayCalculator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?){
        let result = a * b
        return (result, nil)
    }
    //операция умножения
}

class DevCalculator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?) {
        if b == 0 {
            let error = CalculationError(errorText: "hui")
            return (nil, error)
        }
        let result = a / b
        return (result, nil)
    }
    //операция деления
}

class PersentCalcilator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?) {
        let result = b / a * 100
        return (result, nil)
    }
    //операция извлечения процентов
}

class SqareCalculator: Calculator {
    func operation(a: Double, b: Double) -> (result: Double?, error: CalculationError?) {
        let result = sqrt(a)
        return (result, nil)
    }
    //операция извлечения корня
}

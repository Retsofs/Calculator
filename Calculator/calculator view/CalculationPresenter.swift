//
//  CalculationPresenter.swift
//  Calculator
//
//  Created by Alexandr on 09/06/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

enum CalculationOperationType {
    case summ, mult, dev, persent, sqrt, minus
}

class CalculationPresenter {
    var calculator: Calculator = SumCalculator()
    let model = CalculationModel()
    weak var view: CalculatorView?
    var isFirstOperandSet = false
    var stillTyping = false    
    
    
    //TODO
    
    
    init(view: CalculatorView) {
        self.view = view
    }
    func switchCalc(type: CalculationOperationType)  {
        switch type {
        case .mult:
            calculator = MultiplayCalculator()
        case.summ:
            calculator = SumCalculator()
        case.dev:
            calculator = DevCalculator()
        case.persent:
            calculator = PersentCalcilator()
        case.sqrt:
            calculator = SqareCalculator()
            calculate()
        case .minus:
            calculator = MinusCalculator()
        }
        stillTyping = true
        isFirstOperandSet = true
    }
    func setFirstOperand(operand: Double) {
        model.a = Double(operand)
    }
    func setSecondOperand(operand: Double) {
        model.b = Double(operand)
    }
    
    func calculate()  {
        let result = calculator.operation(a: model.a, b: model.b)
        var stringResult: String = ""
        if let errorText = result.error?.localizedDescription {
          stringResult = errorText
        }
        if let result = result.result {
            stringResult = "\(result)"
        }
        stillTyping = false
      showResult(result: stringResult)
        //равенство
    }
    
    func showResult(result: String) {
        view?.showResult(result: result)
    }
    
    func clear ( ){
       model.a = 0
        model.b = 0
        model.result = 0
        view?.showResult(result: "0")
        isFirstOperandSet = false
        stillTyping = false
      //очистка
    }
    
    func plusMinusButton() {
        var result: String
        if isFirstOperandSet {
            model.b = 0 - model.b
            result = String(model.b)
        }else{
            model.a = 0 - model.a
            result = String(model.a)
        }
        showResult(result: result)
        //плюс/минус
    }
    
}

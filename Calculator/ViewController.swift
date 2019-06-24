//
//  ViewController.swift
//  Calculator
//
//  Created by Alexandr on 30/05/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

protocol CalculatorView:class {
    func showResult(result: String)
}

class ViewController: UIViewController, CalculatorView {
    func showResult(result: String) {
        displayResultLabel.text = result
    }
    
    @IBOutlet weak var displayResultLabel: UILabel!
    var presenter: CalculationPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = CalculationPresenter(view: self)
        //дисплей        
        
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        if displayResultLabel.text == "0" || presenter.stillTyping {
            displayResultLabel.text = text
        }else{
            displayResultLabel.text?.append(text)
        }
        guard let labelText = displayResultLabel?.text, let number = Double(labelText) else {
            return
        }
        if presenter.isFirstOperandSet {
            presenter.setSecondOperand(operand: number)
        }else{
            presenter.setFirstOperand(operand: number)
        }
        //цифры
    }
    
    @IBAction func twoOperandsSightPressed( sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        switch text {
        case "+":
            presenter.switchCalc(type: .summ)
        case "×":
            presenter.switchCalc(type: .mult)
        case "÷":
            presenter.switchCalc(type: .dev)
        case "√":
            presenter.switchCalc(type: .sqrt)
        case "-":
            presenter.switchCalc(type: .minus)
        case "%":
            presenter.switchCalc(type: .persent)
        default:
            return
        }
        //+-*/
    }
    
    @IBAction func equalitySignPressed( sender: UIButton) {
        presenter.calculate()
        //равно
    }
    
    @IBAction func clearButtonPressed( sender: UIButton) {
        presenter.clear()
        //очистить
    }
    
    @IBAction func plusMinusButtonPressed( sender: UIButton) {
        presenter.plusMinusButton()
        //+/-
    }
    
    @IBAction func dotButtonPressed( sender: UIButton) {
        if displayResultLabel.text?.contains(".") == true {
            return
        }
        displayResultLabel.text?.append(".")
        //точка
    }
}


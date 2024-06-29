//
//  ViewController.swift
//  UIkitCodeBaseCalculator
//
//  Created by 신효범 on 6/27/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var calculatorLogic = CalculatorLogic()
//    private var number: Int = 0
    let label = UILabel()
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .white
        
        //MARK: - label
        
        label.text = "\(calculatorLogic.displayNumber)"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        //label.backgroundColor = .blue
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
        }
        
        
        //MARK: - button
        
        let buttonTitles = [
            ["7","8","9","+"],
            ["4","5","6","-"],
            ["1","2","3","×"],
            ["AC","0","=","÷"]
        ]
        
        var rows: [UIStackView] = []
        
        for row in buttonTitles {
            var rowButtons: [UIButton] = []
            for title in row {
                let buttonColor: UIColor
                if ["+","-","×","÷","AC","="].contains(title) {
                    buttonColor = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1.0)
                } else {
                    buttonColor = UIColor.lightGray
                }
                let button = ButtonStyle.makeButton(title: title, backgroundColor: buttonColor)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                rowButtons.append(button)
            }
            
            let rowStackView = UIStackView(arrangedSubviews: rowButtons)
            rowStackView.axis = .horizontal
            //rowStackView.backgroundColor = .red
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            rows.append(rowStackView)
            view.addSubview(rowStackView)
            
            rowStackView.snp.makeConstraints {
                $0.height.equalTo(80)
            }
        }
        
        let verticalStackView = UIStackView(arrangedSubviews: rows)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            //$0.leading.trailing.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        print("Button tapped: \(title)")
        
        switch title {
        case "0"..."9":
            calculatorLogic.inputNumber(Int(title)!)
            label.text = "\(calculatorLogic.displayNumber)"
            print("Input number: \(title), Display number: \(calculatorLogic.displayNumber)")
            
        case "+","-","×","÷":
            calculatorLogic.setOperation(title)
            print("Set operation: \(title)")
            
        case "=":
            if let result = calculatorLogic.calculatorResult() {
                label.text = "\(result)"
                print("Calculation result: \(result)")
            } else {
                label.text = "error"
                print("error")
            }
            
        case "AC":
            calculatorLogic.reset()
            label.text = "\(calculatorLogic.displayNumber)"
        default:
            break
        }
    }
    
}


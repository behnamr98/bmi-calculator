//
//  ViewController.swift
//  BMICalculator
//
//  Created by Behnam on 11/12/20.
//  Copyright © 2020 BehnamR. All rights reserved.
//

import UIKit

enum State {
    case afterCalculate
    case beforeCalculate
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var minusWeightButton:RoundedButton!
    @IBOutlet weak var resultView: GradientView!
    @IBOutlet weak var plusWeightButton:RoundedButton!
    @IBOutlet weak var minusHeightButton:RoundedButton!
    @IBOutlet weak var plusHeightButton:RoundedButton!
    @IBOutlet weak var submitView:GradientView!
    @IBOutlet weak var submitButton:UIButton!
    
    @IBOutlet weak var backOFHeightView:UIView!
    @IBOutlet weak var backOFWeightView:UIView!
    
    @IBOutlet weak var weightTF:UITextField!
    @IBOutlet weak var heightTF:UITextField!
    
    @IBOutlet weak var minimumWeightView: GradientView!
    @IBOutlet weak var maximumWeightView: GradientView!
    @IBOutlet weak var maximumWeightLabel: UILabel!
    @IBOutlet weak var minimumWeightLabel: UILabel!
    
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var integerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var heightOfStackView: NSLayoutConstraint!
    
    //MARK: - Variables
    
    private var weight:Double = 65
    private var height:Double = 170
    private var state:State = .beforeCalculate
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        initViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
            Animations.fadeIn(on: self.minusHeightButton)
            Animations.fadeIn(on: self.minusWeightButton)
            Animations.fadeIn(on: self.plusHeightButton)
            Animations.fadeIn(on: self.plusWeightButton)
            Animations.fadeIn(on: self.submitView)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func weightDidChanged(_ sender:UITextField) {
        if let w = Double(sender.text!) {
            weight = w
        }
    }
    
    @IBAction func heightDidChanged(_ sender:UITextField) {
        if let h = Double(sender.text!) {
            height = h
        }
    }
    
    @IBAction func minusHeightTapped(_ sender:UIButton) {
        height -= 1
        Animations.zoomIn(on: heightTF)
        setHeight()
    }
    
    @IBAction func minusWeightTapped(_ sender:UIButton) {
        weight -= 1
        Animations.zoomIn(on: weightTF)
        setWeight()
    }
    
    @IBAction func plusHeightTapped(_ sender:UIButton) {
        height += 1
        Animations.zoomIn(on: heightTF)
        setHeight()
    }
    
    @IBAction func plusWeightTapped(_ sender:UIButton) {
        weight += 1
        Animations.zoomIn(on: weightTF)
        setWeight()
    }
    
    @IBAction func submitTapped(_ sender:UIButton) {
        
        if state == .beforeCalculate {
            calculate()
        } else {
            reset()
        }
    }
    
    //MARK: - Methods
    
    func calculate() {
        state = .afterCalculate
        Vibration.selection.vibrate()
        
        disableInputs(status: true)
        setupViews()
        Animations.fadeIn(on: self.resultView)
        
        Animations.fadeOut(on: submitButton)
        submitButton.setTitle("Reset", for: .normal)
        Animations.fadeIn(on: submitButton)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.submitView.set(colors: [#colorLiteral(red: 0.9994778037, green: 0.6588969827, blue: 0.4270718098, alpha: 1) , #colorLiteral(red: 1, green: 0.5142926574, blue: 0.3143921793, alpha: 1)])
        })
    }
    
    func reset() {
        state = .beforeCalculate
        
        disableInputs(status: false)
        
        Animations.fadeOut(on: resultView)
        
        heightOfStackView.constant = 0
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            self.minimumWeightView.alpha = 0
            self.maximumWeightView.alpha = 0
        }, completion: nil)
        
        Animations.fadeOut(on: submitButton)
        submitButton.setTitle("Calculate your BMI", for: .normal)
        Animations.fadeIn(on: submitButton)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.submitView.set(colors: [#colorLiteral(red: 0.5024486184, green: 0.8365812898, blue: 0.992510736, alpha: 1) , #colorLiteral(red: 0.2607318163, green: 0.5119681954, blue: 0.9391750693, alpha: 1)])
        })
    }
    
    func setupViews() {
        
        let calc = Calculator(height: height, weight: weight)
        let bmi = calc.getBMI()
        setupStateLabel(bmi: bmi)
        
        setMinWeight(minWeight: calc.getMinNormalWeight())
        setMaxWeight(maxWeight: calc.getMaxNormalWeight())
        
        integerLabel.text =  bmi.integerPart()
        decimalLabel.text = bmi.fractionalPart()
    }
    
    func setupStateLabel(bmi:Double) {
        switch bmi {
        case let x where x<18.5:
            stateLabel.text = "Underweight"
            stateLabel.textColor = #colorLiteral(red: 0.9043397307, green: 0.63242805, blue: 0.1818623245, alpha: 1)
            resultView.layer.borderColor = #colorLiteral(red: 0.9043397307, green: 0.63242805, blue: 0.1818623245, alpha: 1)
            Animations.shake(on: resultView)
        case 18.5...24.9:
            stateLabel.text = "Normal"
            stateLabel.textColor = #colorLiteral(red: 0.1865051091, green: 0.6368514299, blue: 0.1969563961, alpha: 1)
            resultView.layer.borderColor = #colorLiteral(red: 0.1865051091, green: 0.6368514299, blue: 0.1969563961, alpha: 1)
        case 25...29.9:
            stateLabel.text = "Overweight"
            stateLabel.textColor = #colorLiteral(red: 0.9125218987, green: 0.3774473071, blue: 0.1397480965, alpha: 1)
            resultView.layer.borderColor = #colorLiteral(red: 0.9125218987, green: 0.3774473071, blue: 0.1397480965, alpha: 1)
            Animations.shake(on: resultView)
        default:
            stateLabel.text = "Obese"
            stateLabel.textColor = #colorLiteral(red: 0.7546105981, green: 0.06139988452, blue: 0.1057428941, alpha: 1)
            resultView.layer.borderColor = #colorLiteral(red: 0.7546105981, green: 0.06139988452, blue: 0.1057428941, alpha: 1)
            Animations.shake(on: resultView)
        }
    }
    
    func setMaxWeight(maxWeight:Double) {
        maximumWeightLabel.text = String(Int(maxWeight))
        heightOfStackView.constant = 142
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            self.minimumWeightView.alpha = 1
            self.maximumWeightView.alpha = 1
        }, completion: nil)
    }
    
    func setMinWeight(minWeight:Double) {
        minimumWeightLabel.text = String(Int(minWeight))
    }
    
    func setHeight() {
        heightTF.text = String(height)
    }
    
    func setWeight() {
        weightTF.text = String(weight)
    }
    
    func disableInputs(status:Bool) {
        minusWeightButton.isEnabled = !status
        minusHeightButton.isEnabled = !status
        plusHeightButton.isEnabled = !status
        plusWeightButton.isEnabled = !status
        
        weightTF.isEnabled = !status
        heightTF.isEnabled = !status
    }
    
    //MARK: - Initilize
    
    func initViews() {
        navigationItem.title = "BMI Calculator"
        submitView.set(colors: [#colorLiteral(red: 0.5024486184, green: 0.8365812898, blue: 0.992510736, alpha: 1) , #colorLiteral(red: 0.2607318163, green: 0.5119681954, blue: 0.9391750693, alpha: 1), #colorLiteral(red: 0.2607318163, green: 0.5119681954, blue: 0.9391750693, alpha: 1)])
        submitView.set(startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 1))
        
        resultView.set(colors: [#colorLiteral(red: 0.8235294118, green: 0.8235294118, blue: 0.8235294118, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        resultView.set(startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 1))
        
        minimumWeightView.set(colors: [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        minimumWeightView.set(startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 1))
        
        maximumWeightView.set(colors: [#colorLiteral(red: 0.9994778037, green: 0.6588969827, blue: 0.4270718098, alpha: 1) , #colorLiteral(red: 1, green: 0.5142926574, blue: 0.3143921793, alpha: 1)])
        maximumWeightView.set(startPoint: .init(x: 0, y: 1), endPoint: .init(x: 1, y: 0))
        
        maximumWeightView.layer.cornerRadius = 8
        minimumWeightView.layer.cornerRadius = 8
        resultView.layer.cornerRadius = 8
        resultView.layer.borderWidth = 4
        
        submitView.layer.cornerRadius = submitView.frame.height/2
        
        minusHeightButton.setContentInset(value: 5)
        minusWeightButton.setContentInset(value: 5)
        submitButton.setContentInset(value: 5)
        
        heightOfStackView.constant = 0
        
    }
    
}


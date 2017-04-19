//
//  ViewController.swift
//  13110110_MayTinh
//
//  Created by Anh Tuong Nguyen on 4/14/17.
//  Copyright © 2017 Cao Yen Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var labelResult: UILabel!
    func forTailingZero(temp:Double) -> String{
        let tempVar = String(format: "%g",temp)
        return tempVar
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            labelResult.text = String(sender.tag - 1)
            numberOnScreen = Double(labelResult.text!)!
            performingMath = false
        }
        else
        {
            labelResult.text = labelResult.text! + String(sender.tag - 1)
            numberOnScreen = Double(labelResult.text!)!
        }
    
    }
    
    @IBAction func buttonPositiveNegative(_ sender: UIButton) {
        var temp: Double
        temp = Double(labelResult.text!)!
        temp = -temp
        labelResult.text = String(describing: Decimal(temp))
    }
    
    @IBAction func buttonPercent(_ sender: UIButton) {
        var temp: Double
        temp = Double(labelResult.text!)!
        temp = temp / 100
        labelResult.text = String(describing: Decimal(temp))
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if labelResult.text != "" && labelResult.text != "Error" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(labelResult.text!)!
            if sender.tag == 12// divide
            {
                labelResult.text = "/";
            }
            else if sender.tag == 13// multiply
            {
                labelResult.text = "x";
            }
            else if sender.tag == 14// minus
            {
                labelResult.text = "-";
            }
            else if sender.tag == 15// plus
            {
                labelResult.text = "+";
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                if (numberOnScreen != 0) {
                    labelResult.text = String(describing: Decimal(previousNumber / numberOnScreen))
                } else {
                    labelResult.text = "Error"
                    numberOnScreen = 0
                    previousNumber = 0
                    operation = 0
                    performingMath = true
                }
            }
            else if operation == 13
            {
                labelResult.text = String(describing: Decimal(previousNumber * numberOnScreen))
            }
            else if operation == 14
            {
                labelResult.text = String(describing: Decimal(previousNumber - numberOnScreen))
            }
            else if operation == 15
            {
                labelResult.text = String(describing: Decimal(previousNumber + numberOnScreen))
            }
        }
        else if sender.tag == 11
        {
            labelResult.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


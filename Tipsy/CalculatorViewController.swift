

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    var splitNumber : Double  = 2.0
    var tipValue : Double = 0
    var tipValueForRes : String = ""
    var resultant : Double = 0
    @IBAction func tipChanged(_ sender: UIButton) {
        
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                sender.isSelected = true
        billTextField.endEditing(true)
        let value = sender.currentTitle!
        tipValueForRes = value
        let valueWithoutPer : Double = Double(value.dropLast())!
        tipValue = valueWithoutPer / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = Double(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var bill = billTextField.text!
        if bill != "" {
            if bill.contains(",") {
            let formatter = NumberFormatter()
            formatter.decimalSeparator = ","
            let grade = formatter.number(from: bill)
        
            if let doubleGrade = grade?.doubleValue {
                print(doubleGrade)
                bill = String(doubleGrade)
                print(bill)
            }
            }
            let result = (Double(bill)! * (1 + tipValue)) / splitNumber
            resultant = result
            let finalResult = String(format: "%0.2f", result)
            bill = finalResult
        }
        performSegue(withIdentifier: "goToResults", sender: self)
        print(bill)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = resultant
            destinationVC.people = splitNumber
            destinationVC.tip = tipValueForRes
        }
    }
}


//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Rafael Veronez Dias on 16/01/23.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var dolarPriceTextfield: UITextField!
    
    @IBOutlet weak var iofValueTextfield: UITextField!
    
    @IBOutlet weak var stateTaxesTextfield: UITextField!
    
    		 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dolarPriceTextfield.text = tc.getFormattedValue(of: tc.dolar, with: "")
        iofValueTextfield.text = tc.getFormattedValue(of: tc.iof, with: "")
        stateTaxesTextfield.text = tc.getFormattedValue(of: tc.stateTax, with: "")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(value: dolarPriceTextfield.text!)!
        tc.iof = tc.convertToDouble(value: iofValueTextfield.text!)!
        tc.stateTax = tc.convertToDouble(value: stateTaxesTextfield.text!)!
    }
    

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}

//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Rafael Veronez Dias on 16/01/23.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var dolarTextField: UITextField!
    @IBOutlet weak var brazilianValueLabel: UILabel!
    
    @IBOutlet weak var currentDolarValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dolarTextField.clearsOnBeginEditing = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAmmount()
        dolarTextField.resignFirstResponder()

    }
    
    
    func setAmmount() {
        guard let dolar = tc.convertToDouble(value: dolarTextField.text!) else { return }
        tc.shoppingValue  = dolar
        brazilianValueLabel.text = tc.getFormattedValue(of: (tc.shoppingValue * tc.dolar ), with: "R$")
        currentDolarValueLabel.text = "Dólar: \(tc.dolar)"
        
    }


}


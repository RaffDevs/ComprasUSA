//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Rafael Veronez Dias on 16/01/23.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var dolarLabel: UILabel!
    @IBOutlet weak var stateTaxesDescriptionLabel: UILabel!
    @IBOutlet weak var stateTaxesLabel: UILabel!
    @IBOutlet weak var iofDescriptionLabel: UILabel!
    @IBOutlet weak var iofLabel: UILabel!
    @IBOutlet weak var isPurchasedWithCreditCardSwitch: UISwitch!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        stateTaxesDescriptionLabel.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, with: "") ?? "?")%)"
        iofDescriptionLabel.text = "IOF (\(tc.getFormattedValue(of: tc.iof, with: "") ?? "?")%)"
        
        dolarLabel.text = tc.getFormattedValue(of: tc.shoppingValue, with: "US$")
        stateTaxesLabel.text = tc.getFormattedValue(of: tc.stateTaxValue, with: "US$")
        iofLabel.text = tc.getFormattedValue(of: tc.iofValue, with: "US$")
        
        let real = tc.calculate(usingCreditCard: isPurchasedWithCreditCardSwitch.isOn)

        totalValueLabel.text = tc.getFormattedValue(of: real, with: "R$")
    }
    
    
    
}

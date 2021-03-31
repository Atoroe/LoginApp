//
//  WellcomeViewController.swift
//  LoginApp
//
//  Created by Artiom Poluyanovich on 31.03.21.
//

import UIKit

class WellcomeViewController: UIViewController {

    @IBOutlet weak var wellcomeTF: UILabel!
    
    var welcomeText: String!
    let clearUserNameTF = ""
    let clearPasswordTF = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        wellcomeTF.text = welcomeText
    }
    
}

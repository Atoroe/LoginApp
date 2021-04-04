//
//  WellcomeViewController.swift
//  LoginApp
//
//  Created by Artiom Poluyanovich on 31.03.21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeTF: UILabel!
    
    var welcomeText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        welcomeTF.text = welcomeText
    }
    
}

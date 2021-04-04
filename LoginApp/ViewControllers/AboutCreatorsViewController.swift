//
//  AboutCreatorsViewController.swift
//  LoginApp
//
//  Created by Artiom Poluyanovich on 4.04.21.
//

import UIKit

class AboutCreatorsViewController: UIViewController {
    
    
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var designerLabel: UILabel!
    
    private let creators = User.getUser().creators
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInfoAboutCreators()
    }
    
    private func setInfoAboutCreators() {
        creatorLabel.text = "Created by \(creators.creator)"
        designerLabel.text = "Designed by \(creators.designer)"
    }
    
}

//
//  AboutUserViewController.swift
//  LoginApp
//
//  Created by Artiom Poluyanovich on 4.04.21.
//

import UIKit

class AboutUserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var maritalStatusLabel: UILabel!
    @IBOutlet weak var spouseLabel: UILabel!
    
    private let character = User.getUser().character
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInfoAboutCharacter()
    }

    private func setInfoAboutCharacter() {
        nameLabel.text = "Name: \(character.name)"
        surnameLabel.text = "Surname: \(character.surname)"
        ageLabel.text = "Age: \(character.age)"
        genderLabel.text = "Gender: \(character.age)"
        occupationLabel.text = "Occupation: \(character.occupation)"
        maritalStatusLabel.text = "Marital Status: \(character.maritalStatus)"
        spouseLabel.text = "Spouse: \(character.spouse)"
    }

}

//
//  ViewController.swift
//  LoginApp
//
//  Created by Artiom Poluyanovich on 31.03.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let wellcomeVC = segue.destination as? WellcomeViewController else { return }
        
        if checkingAutorization() {
            wellcomeVC.welcomeText = "Wellcome, \(userNameTF.text ?? "")"
        } else { return }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    @IBAction func loginButtonPressed() {
        if checkingAutorization(){
            performSegue(withIdentifier: "showWellcomeVC", sender: nil)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let wellcomeVC = segue.source as? WellcomeViewController else { return }
        userNameTF.text = wellcomeVC.clearUserNameTF
        passwordTF.text = wellcomeVC.clearPasswordTF
    }
    
    private func checkingAutorization() -> Bool {
        if userNameTF.text != userName || userNameTF.text?.isEmpty == true {
            addAlert(
                title: "Error",
                message: "Please, check your User Name!",
                textField: userNameTF
            )
            return false
        } else if passwordTF.text != password || passwordTF.text?.isEmpty == true {
            addAlert(
                title: "Error",
                message: "Please, check your Password!",
                textField: passwordTF
            )
            return false
        } else {
            return true
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            if checkingAutorization(){
                performSegue(withIdentifier: "showWellcomeVC", sender: nil)
            }
        }
        return false
    }
}

extension LoginViewController {
    
    func addAlert(title: String, message: String, textField: UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField.text = ""
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}


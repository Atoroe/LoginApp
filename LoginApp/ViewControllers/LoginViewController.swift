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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.welcomeText = "Welcome, \(User.getUser().character.name)"
            } else {
                return
            }
        }
    }
    
    @IBAction func loginButtonPressed() {
        if checkingAutorization(){
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    private func checkingAutorization() -> Bool {
        guard let user = userNameTF.text, user == User.getUser().user,
              let password = passwordTF.text, password == User.getUser().password else {
            addAlert(
                title: "Error",
                message: "Please, check your User Name or Password!",
                textField: userNameTF
            )
            passwordTF.text = ""
            return false
        }
        return true
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}

extension LoginViewController {
    func addAlert(title: String, message: String, textField: UITextField?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}


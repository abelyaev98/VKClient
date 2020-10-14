//
//  LoginViewController.swift
//  VKClient
//
//  Created by Alexander Belyaev on 10.10.2020.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = "user@mail.ru"
        passwordTextField.text = "geekbrains"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Segues
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "HomeSegue" else { return true }
    
        let isValid = validateCredentials()
        if !isValid {
            showLoginErrorAlert()
        }
        return isValid
    }
    
    // MARK: - Actions
    
    @IBAction func scrollTapped(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - Keyboard Events
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                CGRect else { return }
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset = .zero
    }
    
    // MARK: - Helpers
    
    func validateCredentials () -> Bool {
        return loginTextField.text == "user@mail.ru" && passwordTextField.text == "geekbrains"
    }
    
    func showLoginErrorAlert () {
        let loginErrorAlert = UIAlertController(title: "Error", message: "The user name or password is incorrect. Try again.", preferredStyle: .alert)
        let loginErrorAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        loginErrorAlert.addAction(loginErrorAction)
        present(loginErrorAlert, animated: true, completion: nil)
    }
    
}

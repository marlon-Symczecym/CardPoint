//
//  LoginVC.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 09/02/24.
//

import UIKit

class LoginVC: UIViewController {
	
	private var screen: LoginScreen?
	private var viewModel = LoginViewModel()
	private var customAlert: CustomAlert?
	
	override func loadView() {
		screen = LoginScreen()
		
		view = screen
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		customAlert = CustomAlert(controller: self)
		isEnableRegisterButton(isEnable: false)
		
		screen?.delegate(delegate: self)
		screen?.configTextFieldDelegate(textField: self)
		self.navigationController?.isNavigationBarHidden = true
		viewModel.delegate(delegate: self)
	}
	
	private func isEnableRegisterButton(isEnable: Bool) {
		if isEnable {
			self.screen?.loginButton.isEnabled = true
			self.screen?.loginButton.layer.borderColor = UIColor.tintColor.cgColor
			self.screen?.loginButton.setTitleColor(.tintColor, for: .normal)
		} else {
			self.screen?.loginButton.isEnabled = false
			self.screen?.loginButton.layer.borderColor = UIColor.tintColor.withAlphaComponent(0.5).cgColor
			self.screen?.loginButton.setTitleColor(.tintColor.withAlphaComponent(0.5), for: .normal)
		}
	}
	
	private func validadeTextField(email: String, password: String) {
		if email.isValid(validType: .email) && password.isValid(validType: .password) {
			isEnableRegisterButton(isEnable: true)
		} else {
			isEnableRegisterButton(isEnable: false)
		}
	}
}

extension LoginVC: LoginViewModelProtocol {
	func success() {
		let home = HomeVC()
		self.navigationController?.pushViewController(home, animated: true)
	}
	
	func error(error: String) {
		customAlert?.basic(title: "Erro no login =(", message: error)
	}
}

extension LoginVC: LoginScreenProtocol {
	func tappedLoginButton() {
		DispatchQueue.main.async {
			self.viewModel.signin(email: self.screen?.emailTF.text ?? "", password: self.screen?.passwordTF.text ?? "")
		}
	}
	
	func tappedSignupLabel() {
		let signup = SignupVC()
		self.navigationController?.pushViewController(signup, animated: true)
	}
}

extension LoginVC: UITextFieldDelegate {
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		let email = screen?.emailTF.text ?? ""
		let password = screen?.passwordTF.text ?? ""
		
		validadeTextField(email: email, password: password)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		dismissKeyboard()
		
		return false
	}
}

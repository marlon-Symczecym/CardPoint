//
//  SignupVC.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import UIKit

class SignupVC: UIViewController {
	
	private var screen: SignupScreen?
	private var viewModel = SignupViewModel()
	private var customAlert: CustomAlert?
	
	override func loadView() {
		screen = SignupScreen()
		
		view = screen
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		customAlert = CustomAlert(controller: self)
		isEnableRegisterButton(isEnable: false)

		screen?.delegate(delegate: self)
		screen?.configTextFieldDelegate(textField: self)
		viewModel.delegate(delegate: self)
    }
	
	private func isEnableRegisterButton(isEnable: Bool) {
		if isEnable {
			self.screen?.signupButton.isEnabled = true
			self.screen?.signupButton.layer.borderColor = UIColor.tintColor.cgColor
			self.screen?.signupButton.setTitleColor(.tintColor, for: .normal)
		} else {
			self.screen?.signupButton.isEnabled = false
			self.screen?.signupButton.layer.borderColor = UIColor.tintColor.withAlphaComponent(0.5).cgColor
			self.screen?.signupButton.setTitleColor(.tintColor.withAlphaComponent(0.5), for: .normal)
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

extension SignupVC: SignupViewModelProtocol {
	func success() {
		customAlert?.basic(title: "Sucesso =)", message: "Cadastro realizado com sucesso!", completion: {
			self.navigationController?.popViewController(animated: true)
		})
	}
	
	func error(error: String) {
		customAlert?.basic(title: "Erro no Cadastro =(", message: error)
	}
}

extension SignupVC: SignupScreenProtocol {
	func tappedBackButton() {
		self.navigationController?.popViewController(animated: true)
	}
	
	func tappedSignupButton() {
		DispatchQueue.main.async {
			self.viewModel.signup(email: self.screen?.emailTF.text ?? "", password: self.screen?.passwordTF.text ?? "")
		}
	}
}

extension SignupVC: UITextFieldDelegate {
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		let email = self.screen?.emailTF.text ?? ""
		let password = self.screen?.passwordTF.text ?? ""
		
		validadeTextField(email: email, password: password)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		dismissKeyboard()
		
		return false
	}
}

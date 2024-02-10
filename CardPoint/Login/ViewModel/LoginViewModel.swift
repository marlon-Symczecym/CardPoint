//
//  LoginViewModel.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import UIKit
import Firebase

protocol LoginViewModelProtocol: AnyObject {
	func success()
	func error(error: String)
}

class LoginViewModel: UIView {
	private weak var delegate: LoginViewModelProtocol?
	private var auth = Auth.auth()
	
	public func delegate(delegate: LoginViewModelProtocol?) {
		self.delegate = delegate
	}
    
	public func signin(email: String, password: String) {
		auth.signIn(withEmail: email, password: password) { data, error in
			if error == nil {
				self.delegate?.success()
			} else {
				self.delegate?.error(error: error?.localizedDescription ?? "")
			}
		}
	}
}

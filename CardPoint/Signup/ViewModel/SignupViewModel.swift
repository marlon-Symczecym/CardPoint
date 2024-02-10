//
//  SignupViewModel.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import UIKit
import Firebase

protocol SignupViewModelProtocol: AnyObject {
	func success()
	func error(error: String)
}

class SignupViewModel: UIView {

	private weak var delegate: SignupViewModelProtocol?
	private var auth = Auth.auth()
	
	public func delegate(delegate: SignupViewModelProtocol?) {
		self.delegate = delegate
	}
	
	public func signup(email: String, password: String) {
		auth.createUser(withEmail: email, password: password) { data, error in
			if error == nil {
				self.delegate?.success()
			} else {
				self.delegate?.error(error: error?.localizedDescription ?? "")
			}
		}
	}
}

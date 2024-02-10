//
//  SignupScreen.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import UIKit

protocol SignupScreenProtocol: AnyObject {
	func tappedSignupButton()
	func tappedBackButton()
}

class SignupScreen: UIView {
	
	private weak var delegate: SignupScreenProtocol?
	
	public func delegate(delegate: SignupScreenProtocol?) {
		self.delegate = delegate
	}
	
	lazy var backButton: UIButton = {
		let button = UIButton()
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "arrowshape.backward.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
		button.tintColor = .tintColor
		button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
		
		return button
	}()
	
	@objc func tappedBackButton() {
		delegate?.tappedBackButton()
	}
	
	lazy var loginLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "CADASTRO"
		label.font = .systemFont(ofSize: 30, weight: .regular)
		label.textColor = .black
		label.textAlignment = .center
		
		return label
	}()
	
	lazy var emailLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "E-mail"
		label.font = .systemFont(ofSize: 16, weight: .medium)
		label.textColor = .black
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var emailRecView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .tintColor
		view.clipsToBounds = true
		view.layer.cornerRadius = 8
		
		return view
	}()
	
	lazy var emailTF: UITextField = {
		let tf = UITextField()
		
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.setPlaceholderColor(placeholder: "Digite seu e-mail...", color: .white)
		tf.textAlignment = .left
		tf.textColor = .white
		tf.font = .systemFont(ofSize: 16, weight: .regular)
		tf.keyboardType = .default
		tf.autocapitalizationType = .none
		tf.autocorrectionType = .no
		
		return tf
	}()
	
	lazy var passwordLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Senha"
		label.font = .systemFont(ofSize: 16, weight: .medium)
		label.textColor = .black
		label.textAlignment = .left
		
		return label
	}()
	
	lazy var passwordRecView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .tintColor
		view.clipsToBounds = true
		view.layer.cornerRadius = 8
		
		return view
	}()
	
	lazy var passwordTF: UITextField = {
		let tf = UITextField()
		
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.setPlaceholderColor(placeholder: "Digite sua senha...", color: .white)
		tf.textAlignment = .left
		tf.font = .systemFont(ofSize: 16, weight: .regular)
		tf.textColor = .white
		tf.keyboardType = .default
		tf.isSecureTextEntry = true
		tf.autocapitalizationType = .none
		tf.autocorrectionType = .no
		
		return tf
	}()
	
	lazy var signupButton: UIButton = {
		let button = UIButton()
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Cadastrar", for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 20)
		button.setTitleColor(.tintColor, for: .normal)
		button.backgroundColor = .white
		button.layer.borderWidth = 2.0
		button.layer.borderColor = UIColor.tintColor.cgColor
		button.clipsToBounds = true
		button.layer.cornerRadius = 8
		
		button.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
		
		return button
	}()
	
	@objc func tappedSignupButton() {
		delegate?.tappedSignupButton()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .white
		
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(loginLabel)
		addSubview(emailLabel)
		addSubview(emailRecView)
		emailRecView.addSubview(emailTF)
		addSubview(passwordLabel)
		addSubview(passwordRecView)
		passwordRecView.addSubview(passwordTF)
		addSubview(signupButton)
		addSubview(backButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// backButton
			backButton.topAnchor.constraint(equalTo: loginLabel.topAnchor),
			backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			backButton.centerYAnchor.constraint(equalTo: loginLabel.centerYAnchor),
			
			// loginLabel
			loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			// emailLabel
			emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
			emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			
			// emailRecView
			emailRecView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
			emailRecView.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
			emailRecView.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
			emailRecView.heightAnchor.constraint(equalToConstant: 50),
			
			// emailTF
			emailTF.centerYAnchor.constraint(equalTo: emailRecView.centerYAnchor),
			emailTF.leadingAnchor.constraint(equalTo: emailRecView.leadingAnchor, constant: 20),
			emailTF.trailingAnchor.constraint(equalTo: emailRecView.trailingAnchor, constant: -20),
			emailTF.heightAnchor.constraint(equalToConstant: 40),
			
			// passwordLabel
			passwordLabel.topAnchor.constraint(equalTo: emailRecView.bottomAnchor, constant: 30),
			passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
			passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
			
			// passwordRecView
			passwordRecView.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
			passwordRecView.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
			passwordRecView.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
			passwordRecView.heightAnchor.constraint(equalToConstant: 50),
			
			// passwordTF
			passwordTF.centerYAnchor.constraint(equalTo: passwordRecView.centerYAnchor),
			passwordTF.leadingAnchor.constraint(equalTo: passwordRecView.leadingAnchor, constant: 20),
			passwordTF.trailingAnchor.constraint(equalTo: passwordRecView.trailingAnchor, constant: -20),
			passwordTF.heightAnchor.constraint(equalToConstant: 40),
			
			// signupButton
			signupButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			signupButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
			signupButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
			signupButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
			signupButton.heightAnchor.constraint(equalToConstant: 50),
		])
	}
	
	public func configTextFieldDelegate(textField: UITextFieldDelegate) {
		self.emailTF.delegate = textField
		self.passwordTF.delegate = textField
	}
}

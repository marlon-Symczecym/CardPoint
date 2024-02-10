//
//  LoginScreen.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 09/02/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
	func tappedSignupLabel()
	func tappedLoginButton()
}

class LoginScreen: UIView {
	
	private weak var delegate: LoginScreenProtocol?
	
	public func delegate(delegate: LoginScreenProtocol?) {
		self.delegate = delegate
	}
	
	lazy var appLogo: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "CardPoint"
		label.font = .boldSystemFont(ofSize: 40)
		label.textColor = .tintColor
		label.textAlignment = .center
		
		return label
	}()
	
	lazy var loginLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "LOGIN"
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
	
	lazy var signupLabel: UILabel = {
		let label = UILabel()
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Cadastrar"
		label.font = .systemFont(ofSize: 20, weight: .medium)
		label.textColor = .tintColor
		
		let  tap = UITapGestureRecognizer(target: self, action: #selector(tappedSignupLabel))
		
		label.isUserInteractionEnabled = true
		label.addGestureRecognizer(tap)
		
		return label
	}()
	
	@objc func tappedSignupLabel() {
		delegate?.tappedSignupLabel()
	}
	
	lazy var loginButton: UIButton = {
		let button = UIButton()
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Entrar", for: .normal)
		button.titleLabel?.font = .boldSystemFont(ofSize: 20)
		button.setTitleColor(.tintColor, for: .normal)
		button.backgroundColor = .white
		button.layer.borderWidth = 2.0
		button.layer.borderColor = UIColor.tintColor.cgColor
		button.clipsToBounds = true
		button.layer.cornerRadius = 8
		
		button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
		
		return button
	}()
	
	@objc func tappedLoginButton() {
		delegate?.tappedLoginButton()
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
		addSubview(appLogo)
		addSubview(loginLabel)
		addSubview(emailLabel)
		addSubview(emailRecView)
		emailRecView.addSubview(emailTF)
		addSubview(passwordLabel)
		addSubview(passwordRecView)
		passwordRecView.addSubview(passwordTF)
		addSubview(signupLabel)
		addSubview(loginButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// appLogo
			appLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			appLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			// loginLabel
			loginLabel.topAnchor.constraint(equalTo: appLogo.bottomAnchor, constant: 60),
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
			emailTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			emailTF.heightAnchor.constraint(equalToConstant: 40),
			
			// passwordLabel
			passwordLabel.topAnchor.constraint(equalTo: emailRecView.bottomAnchor, constant: 40),
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
			signupLabel.topAnchor.constraint(equalTo: passwordRecView.bottomAnchor, constant: 20),
			signupLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
			
			// loginButton
			loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
			loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
			loginButton.heightAnchor.constraint(equalToConstant: 50),
		])
	}
	
	public func configTextFieldDelegate(textField: UITextFieldDelegate) {
		emailTF.delegate = textField
		passwordTF.delegate = textField
	}
}

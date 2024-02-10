//
//  CustomAlert.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import UIKit

class CustomAlert {

	private var controller = UIViewController()
	
	init(controller: UIViewController) {
		self.controller = controller
	}
	
	public func basic(title: String, message: String, completion: (()-> Void)? = nil) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let ok = UIAlertAction(title: "OK", style: .cancel) { action in
			completion?()
		}
		
		alertController.addAction(ok)
		controller.present(alertController, animated: true)
	}
}

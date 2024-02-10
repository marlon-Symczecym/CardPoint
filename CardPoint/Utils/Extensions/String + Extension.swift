//
//  String + Extension.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 10/02/24.
//

import Foundation
import UIKit

public enum ValidType{
	case email
	case password
}

extension String {
	enum Regex: String {
		case email = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z-a-z]{2,64}"
		case password = ".{6,}"
	}
	
	func isValid(validType: ValidType) -> Bool {
		let format = "SELF MATCHES %@"
		var regex = ""
		
		switch validType {
		case .email:
			regex = Regex.email.rawValue
		case .password:
			regex = Regex.password.rawValue
		}
		
		return NSPredicate(format: format, regex).evaluate(with: self)
	}
}

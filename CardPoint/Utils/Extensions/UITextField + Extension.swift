//
//  UITextField + Extension.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 09/02/24.
//

import UIKit

extension UITextField {

	func setPlaceholderColor(placeholder: String, color: UIColor) {
		self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
	}

}

//
//  UIViewController.swift
//  CardPoint
//
//  Created by Marlon Symczecym on 09/02/24.
//

import Foundation
import UIKit

extension UIViewController {
	public func dismissKeyboard() {
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_ :)))
		tap.cancelsTouchesInView = true
		view.addGestureRecognizer(tap)
	}
}

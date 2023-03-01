//
//  ReusableView.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import UIKit

public protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

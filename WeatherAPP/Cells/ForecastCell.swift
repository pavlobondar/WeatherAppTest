//
//  ForecastCell.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import UIKit

final class ForecastCell: UITableViewCell {
    
    var viewModel: ViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel as? ForecastViewModel else {
                return
            }
            viewModelChanged(viewModel)
        }
    }
    
    private func viewModelChanged(_ viewModel: ForecastViewModel) {
        self.textLabel?.text = viewModel.tempC
        self.textLabel?.lineBreakMode = .byWordWrapping
        self.textLabel?.numberOfLines = 2
        self.detailTextLabel?.text = viewModel.date
        self.imageView?.image = UIImage(named: viewModel.icon)
        self.imageView?.contentMode = .scaleAspectFit
    }
}

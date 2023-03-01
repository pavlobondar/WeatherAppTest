//
//  LocationCell.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import UIKit

final class LocationCell: UITableViewCell {
        
    var viewModel: ViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel as? LocationViewModel else {
                return
            }
            viewModelChanged(viewModel)
        }
    }
    
    private func viewModelChanged(_ viewModel: LocationViewModel) {
        textLabel?.font = .systemFont(ofSize: 22.0, weight: .bold)
        textLabel?.text = viewModel.city
        detailTextLabel?.text = viewModel.date
    }
}

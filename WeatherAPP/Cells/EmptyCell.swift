//
//  EmptyCell.swift
//  WeatherAPP
//
//  Created by Pavlo on 01.03.2023.
//

import UIKit

final class EmptyCell: UITableViewCell {
    
    var viewModel: ViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel as? EmptyViewModel else {
                return
            }
            viewModelChanged(viewModel)
        }
    }
    
    private func viewModelChanged(_ viewModel: EmptyViewModel) {
        self.textLabel?.text = viewModel.title
        self.detailTextLabel?.text = viewModel.subtitle
        self.imageView?.image = UIImage(systemName: viewModel.image)
        self.imageView?.contentMode = .scaleAspectFit
    }
}

//
//  WeatherTableViewController.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import UIKit

final class WeatherTableViewController: UITableViewController {
    
    private var viewModel: WeatherViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUIBarNavigationItem()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sectionData[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.sectionData[section].type.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.getCellViewModel(for: indexPath)
        switch viewModel.headerType(for: indexPath) {
        case .loction:
            let cell = LocationCell(style: .subtitle, reuseIdentifier: nil)
            cell.viewModel = cellViewModel
            return cell
        case .forecast:
            let cell = ForecastCell(style: .subtitle, reuseIdentifier: nil)
            cell.viewModel = cellViewModel
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    private func initViewModel() {
        self.viewModel = WeatherViewModel()
        self.viewModel.bindWeatherViewModelToController = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupUIBarNavigationItem() {
        let barButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshWeatherData))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    private func registerCells() {
        tableView.register(LocationCell.self)
        tableView.register(ForecastCell.self)
    }
    
    @objc
    private func refreshWeatherData() {
        self.viewModel.updateWeatherData()
    }
}

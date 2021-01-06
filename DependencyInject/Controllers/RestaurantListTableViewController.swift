//
//  RestaurantListTableViewController.swift
//  DependencyInject
//
//  Created by 신동규 on 2021/01/06.
//

import UIKit

private let reuseIdentifier = "cell"

class RestaurantListTableViewController: UITableViewController {
    
    // MARK: Properties
    var restaurants:[Restaurant] = [] {
        didSet {
            self.loading.isHidden = true
            self.tableView.reloadData()
        }
    }
    
    private lazy var loading:LoadingView = {
        let lv = LoadingView()
        return lv
    }()
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestaurantLister.shared.get { self.restaurants = $0 }

        configureUI()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: Configures
    func configureUI() {
        tableView.backgroundColor = .systemBackground
        
        view.addSubview(loading)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loading.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        let restaurant = self.restaurants[indexPath.row]
        cell.restaurant = restaurant
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }


}

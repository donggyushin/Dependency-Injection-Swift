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
    
    let restaurantLister:RestaurantLister
    
    private lazy var loading:LoadingView = {
        let lv = LoadingView()
        return lv
    }()
    
    // MARK: Lifecycles
    init(restaurantLister:RestaurantLister) {
        
        self.restaurantLister = restaurantLister
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchRestaurants()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: Fetch APIs
    func fetchRestaurants() {
        self.restaurantLister.get { self.restaurants = $0 }
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

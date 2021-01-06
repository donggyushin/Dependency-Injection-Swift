//
//  TableViewCell.swift
//  DependencyInject
//
//  Created by 신동규 on 2021/01/06.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: Properties
    var restaurant:Restaurant? {
        didSet {
            guard let restaurant = self.restaurant else { return }
            self.titleLabel.text = restaurant.name
            let cuisinesText = restaurant
                        .cuisines
                        .enumerated()
                        .reduce("", { (result, next: (index: Int, element: Cuisine)) -> String in
                            if next.index == 0 {
                                return next.element.rawValue
                            } else {
                                return "\(result) • \(next.element.rawValue)"
                            }
                        })
            self.descriptionLabel.text = cuisinesText
        }
    }
    
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: Lifecycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Configures
    func configureUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

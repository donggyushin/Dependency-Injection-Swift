//
//  LoadingView.swift
//  DependencyInject
//
//  Created by 신동규 on 2021/01/06.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: Properties
    private lazy var indicator:UIActivityIndicatorView = {
        let id = UIActivityIndicatorView()
        return id
    }()

    // MARK: Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configures
    func configureUI() {
        backgroundColor = .systemBackground
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.startAnimating()
    }

}

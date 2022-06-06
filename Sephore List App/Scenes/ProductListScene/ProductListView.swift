//
//  ProductListView.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//

import UIKit

public class ProductListView: UIView {
    
    let headerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
        return v
    }()
    
    let headerTitle: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "SEPHORA"
        v.textColor = .white
        v.font = .boldSystemFont(ofSize: 48)
        return v
    }()
    
    let headerDescription: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "La liste des produits SEPHORA disponibles"
        v.textColor = .white
        v.font = .boldSystemFont(ofSize: 16)
        v.textAlignment = .center
        v.alpha = 0.8
        return v
    }()
    
    let productTableView: UITableView = {
        let v = UITableView()
        v.backgroundColor = .clear
        v.separatorStyle = .none
        v.register(ProductListViewCell.self, forCellReuseIdentifier: ProductListViewCell.identifier)
        v.keyboardDismissMode = .onDrag
        v.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.stopAnimating()
        v.isHidden = true
        return v
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        layout()
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(headerView)
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerDescription)
        addSubview(productTableView)
        addSubview(activityIndicator)
        startAnimating()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 260),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headerTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            headerDescription.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 16),
            headerDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            headerDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            productTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            productTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func startAnimating() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    public func stopAnimating() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

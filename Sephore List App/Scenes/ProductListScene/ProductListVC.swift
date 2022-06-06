//
//  ProductListVC.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//

import UIKit

public class ProductListVC: PairingViewController<ProductListView> {
    
    private var productList: [Product] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchProductList()
    }
    
    public override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
    }
    
    func configureTableView() {
        pairedView.productTableView.delegate = self
        pairedView.productTableView.dataSource = self
        pairedView.productTableView.register(ProductListViewCell.self, forCellReuseIdentifier: ProductListViewCell.identifier)
    }
    
    public func fetchProductList() {
        ProductService.sharedInstance.getAllProducts(onSuccess: { data in
            let decoder = JSONDecoder()
            self.productList = try! decoder.decode(Array<Product>.self, from: data)
            DispatchQueue.main.async {
                self.productList.sort { $0.isSpecial && !$1.isSpecial }
                self.pairedView.productTableView.reloadData()
                self.pairedView.stopAnimating()
            }
        }, onFailure: { error in
            print(error)
        })
    }
    
    
}


extension ProductListVC: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListViewCell.identifier, for: indexPath) as! ProductListViewCell
        
        cell.productBrand.text = productList[indexPath.row].brand.name
        cell.productPrice.text = productList[indexPath.row].price.description + "$"
        cell.productName.text = productList[indexPath.row].name
        cell.productDescription.text = productList[indexPath.row].description
        cell.imageURL = productList[indexPath.row].image.small
        cell.isSpecial = productList[indexPath.row].isSpecial

        return cell
    }
    
    
}

extension ProductListVC: UITableViewDelegate {
    
}

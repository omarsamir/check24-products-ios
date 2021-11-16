//
//  ViewController.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import UIKit

class ProductsViewController: UIViewController{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productsTableView: UITableView!
    
    private var presenter: ProdcutsPresenter?
    private var products = [Product]()
    private var filteredProducts = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProdcutsPresenter(view: self)
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCellTableViewCell")
        presenter?.fetchProducts()
    }
    
    
    //MARK:- Filters
    
    @IBAction func didAllFilterPressed(_ sender: Any) {
        presenter?.filterProducts(products: self.products, by: Filter(all: true, favorite: false, available: false))
    }
    
    @IBAction func didAvailableFilterPressed(_ sender: Any) {
        presenter?.filterProducts(products: self.products, by: Filter(all: false, favorite: false, available: true))
    }
    
    @IBAction func didFavoriteFilterPressed(_ sender: Any) {
        presenter?.filterProducts(products: self.products, by: Filter(all: false, favorite: true, available: false))
    }
}


extension ProductsViewController: ProductsViewProtocol {
    func displayProducts(with products: [Product], from filter: Bool) {
        if !filter {
            self.products = products
        }
        self.filteredProducts = products
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
    
    func displayTitle(with title: String, subTitle: String) {
        DispatchQueue.main.async {
            self.titleLabel.text = title
            self.descriptionLabel.text = subTitle
        }
    }
    func displayErrorMessage(with errorMessage: String) {
        DispatchQueue.main.async {
            //            TODO:- add UI for error
        }
    }
}

extension ProductsViewController :  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}

extension ProductsViewController :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellTableViewCell", for: indexPath) as! ProductCellTableViewCell
        cell.prepareProductCell(with: self.filteredProducts[indexPath.row])
        if indexPath.row == self.filteredProducts.count - 1 {
            self.filteredProducts = self.products
        }
        return cell
    }
    
    
}


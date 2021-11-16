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
    private var products: [Product]?
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
    }
    
    @IBAction func didAvailableFilterPressed(_ sender: Any) {
    }
    
    @IBAction func didFavoriteFilterPressed(_ sender: Any) {
    }
}


extension ProductsViewController: ProductsViewProtocol {
    func displayProductsList(with products: [Product]) {
        self.products = products
        self.productsTableView.reloadData()
    }
    
    func displayErrorMessage(with errorMessage: String) {
        
    }
}

extension ProductsViewController :  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}

extension ProductsViewController :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellTableViewCell", for: indexPath) as! ProductCellTableViewCell
        return cell
    }
    
    
}


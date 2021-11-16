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
//        presenter?.fetchProducts()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
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
        return UITableViewCell()
    }
    
    
}


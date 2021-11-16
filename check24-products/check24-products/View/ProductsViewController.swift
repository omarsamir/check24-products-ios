//
//  ViewController.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import UIKit

class ProductsViewController: UIViewController {
    private var presenter: ProdcutsPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProdcutsPresenter(view: self)
        presenter?.fetchProducts()
    }
}


extension ProductsViewController: ProductsViewProtocol {
    func displayProductsList(with products: [Product]) {
        
    }
    
    func displayErrorMessage(with errorMessage: String) {
        
    }
}


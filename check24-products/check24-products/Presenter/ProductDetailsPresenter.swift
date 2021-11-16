//
//  ProductDetailsPresenter.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//


import UIKit
protocol ProductDetailsViewProtocol: class {
    func setupUI(product: Product, image: UIImage?)
}

class ProductDetailsPresenter {
    private var view: ProductDetailsViewProtocol?
    
    init(view: ProductDetailsViewProtocol) {
        self.view = view
    }
    
    func presentProductDetails(product: ProductDetailsRichModel){
        self.view?.setupUI(product: product.product!, image: product.image)
    }
}

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

protocol ProductsPresenterProtocol: class {
    func updateFavorite(productID: Int)
}

class ProductDetailsPresenter {
    private weak var view: ProductDetailsViewProtocol?
    weak var productsPresenterDelegate: ProductsPresenterProtocol?
    init(view: ProductDetailsViewProtocol) {
        self.view = view
    }
    
    func presentProductDetails(product: ProductDetailsRichModel){
        self.view?.setupUI(product: product.product!, image: product.image)
    }
    
    func favorite(productID: Int){
        self.productsPresenterDelegate?.updateFavorite(productID: productID)
    }
}

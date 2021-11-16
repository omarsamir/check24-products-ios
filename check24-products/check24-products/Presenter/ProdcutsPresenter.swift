//
//  ProdcutsPresenter.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation
protocol ProductsViewProtocol: class {
    func displayProductsList(with products: [Product])
    func displayError(with errror: Error)
}
class ProdcutsPresenter {
    private var view: ProductsViewProtocol?
    init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func fetchProducts(){
        APIClient.fetchRequest(with: Constants.LIST_PRODUCTS_SERVICE_PATH) { (data, error) in
            guard let data = data else { return }
            let productsObj = try? JSONDecoder().decode(ProductsModel.self, from: data)
            print(productsObj)
        }
    }
}

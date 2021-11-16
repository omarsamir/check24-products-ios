//
//  ProdcutsPresenter.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation
protocol ProductsViewProtocol: class {
    func displayProductsList(with products: [Product])
    func displayErrorMessage(with errorMessage: String)
}
class ProdcutsPresenter {
    private var view: ProductsViewProtocol?
    init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func fetchProducts(){
        APIClient.fetchRequest(with: Constants.listProductsServicePath) { [weak self](data, error) in
            do {
                let productsObj = try JSONDecoder().decode(ProductsModel.self, from: data!)
                guard let products = productsObj.products else {
                    self?.handleError( NSError(domain: Constants.emptyDataErrorDomain, code: Constants.emptyDataErrorCode, userInfo: nil))
                    return
                }
                self?.view?.displayProductsList(with: products)
            } catch let error{
                self?.handleError(error as NSError)
            }
        }
    }
    
    private func handleError(_ error: NSError){
        if error.domain == Constants.emptyDataErrorDomain {
            self.view?.displayErrorMessage(with: Constants.emptyDataErrorMessage)
        } else if error.domain == Constants.parsingDataErrorDomain {
            self.view?.displayErrorMessage(with: Constants.parsingDataErrorMessage)
        } else {
            self.view?.displayErrorMessage(with: error.localizedDescription)
        }
    }
}

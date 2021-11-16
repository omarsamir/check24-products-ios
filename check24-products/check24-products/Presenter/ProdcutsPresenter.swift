//
//  ProdcutsPresenter.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation
protocol ProductsViewProtocol: class {
    func displayProducts(with products: [Product], from filter: Bool)
    func displayTitle(with title: String, subTitle: String)
    func displayErrorMessage(with errorMessage: String)
}
class ProdcutsPresenter {
    private weak var view: ProductsViewProtocol?
    init(view: ProductsViewProtocol) {
        self.view = view
    }
    
    func fetchProducts(){
        APIClient.fetchRequest(with: Constants.listProductsServicePath) { [weak self](data, error) in
            do {
                let productsObj = try JSONDecoder().decode(ProductsModel.self, from: data!)
                guard let products = productsObj.products  else {
                    self?.handleError( NSError(domain: Constants.emptyDataErrorDomain, code: Constants.emptyDataErrorCode, userInfo: nil))
                    return
                }
                
                self?.view?.displayTitle(with: productsObj.header?.headerTitle ?? "", subTitle: productsObj.header?.headerDescription ?? "")
                self?.view?.displayProducts(with: products, from: false)
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
    
    func filterProducts(products: [Product], by filter: Filter)  {
        var filteredList = products
        if !filter.all && filter.available && !filter.favorite {
            filteredList = products.filter({$0.available == true})
        } else if !filter.all && !filter.available && filter.favorite {
            filteredList = products.filter({$0.isFav == true})
        }
        self.view?.displayProducts(with: filteredList, from: true)
    }
}

extension ProdcutsPresenter: ProductsPresenterProtocol {
    func updateFavorite(productID: Int) {
        print("")
    }
}

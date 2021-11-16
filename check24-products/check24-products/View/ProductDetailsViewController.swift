//
//  ProductDetailsViewController.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    var presenter: ProductDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProductDetailsPresenter(view: self)
    }
}


extension ProductDetailsViewController: ProductDetailsViewProtocol {
    func setupUI(product: Product, image: UIImage?){
        imageView.image = image
        titleLabel.text = product.name
        priceLabel.text = "\(String(product.price?.value ?? 0)) \(product.price?.currency?.rawValue ?? "")"
        rateLabel.text = String(product.rating ?? 0)
        dateLabel.text  = Utils.timestampToDate(with: product.releaseDate ?? 0)
        shortDescriptionLabel.text = product.productDescription
        longDescriptionLabel.text = product.longDescription
    }
}

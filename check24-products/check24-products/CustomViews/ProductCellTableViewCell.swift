//
//  ProductCellTableViewCell.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareProductCell(with product: Product){
        rightImageView.isHidden = product.available ?? false
        leftImageView.isHidden = !(product.available ?? false)
        titleLabel.text = product.name
        descriptionLabel.text = product.productDescription
        loadImage(with: product.imageURL ?? "", availability: product.available ?? false)
        priceLabel.text = "\(String(product.price?.value ?? 0)) \(product.price?.currency?.rawValue ?? "")"
        dateLabel.text = Utils.timestampToDate(with: product.releaseDate ?? 0)
    }
    
    private func loadImage(with urlString: String, availability: Bool) {
        guard let url = URL(string: urlString) else { return }
        APIClient.loadImage(from: url) { [weak self] (data, urlResponse, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
            if availability {
                self?.leftImageView.image = UIImage(data: data)
            } else {
                self?.rightImageView.image = UIImage(data: data)
            }
            }
        }
    }
    
}

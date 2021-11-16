//
//  ProductsModel.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import UIKit

// MARK: - ProductsModel
struct ProductsModel: Codable {
    let header: Header?
    let filters: [String]?
    let products: [Product]?
}

// MARK: - Header
struct Header: Codable {
    let headerTitle, headerDescription: String?
}

// MARK: - Product
struct Product: Codable {
    let name: String?
    let type: TypeEnum?
    let id: Int?
    let color: Color?
    let imageURL: String?
    let colorCode: ColorCode?
    let available: Bool?
    let releaseDate: Int?
    let productDescription, longDescription: String?
    let rating: Double?
    let price: Price?
    let isFav: Bool?
    

    enum CodingKeys: String, CodingKey {
        case name, type, id, color, imageURL, colorCode, available, releaseDate, isFav
        case productDescription = "description"
        case longDescription, rating, price
    }
}

enum Color: String, Codable {
    case blue = "Blue"
    case green = "Green"
    case red = "Red"
    case yellow = "Yellow"
}

enum ColorCode: String, Codable {
    case bbdefb = "BBDEFB"
    case c8E6C9 = "C8E6C9"
    case ffCDD2 = "ffCDD2"
    case ffecb3 = "FFECB3"
}

// MARK: - Price
struct Price: Codable {
    let value: Double?
    let currency: Currency?
}

enum Currency: String, Codable {
    case eur = "EUR"
}

enum TypeEnum: String, Codable {
    case circle = "Circle"
    case hexagon = "Hexagon"
    case square = "Square"
    case triangle = "Triangle"
}

struct Filter {
    let all: Bool
    let favorite: Bool
    let available: Bool
}

struct ProductDetailsRichModel {
    let product: Product?
    let image: UIImage?
}


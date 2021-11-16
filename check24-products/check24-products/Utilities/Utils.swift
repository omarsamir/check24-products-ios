//
//  Utils.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation

class Utils {
    static func timestampToDate(with timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.mm.yyyy" //Specify your format that you want
        return dateFormatter.string(from: date)
    }
}

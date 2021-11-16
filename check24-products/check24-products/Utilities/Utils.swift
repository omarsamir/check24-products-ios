//
//  Utils.swift
//  check24-products
//
//  Created by omar on 16/11/2021.
//

import Foundation

class Utils {
    // getting this syntax from this link: https://stackoverflow.com/questions/40648284/using-dateformatter-on-a-unix-timestamp
    static func timestampToDate(with timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.mm.yyyy"
        return dateFormatter.string(from: date)
    }
}

//
//  ProductList.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation
/// Decodes response from server
struct ProductList: Codable {
    let entries: [Product]?
}

// MARK: - Entry
struct Product: Codable {
    let code: String?
    let image: String?
    let name, price, type: String?
}

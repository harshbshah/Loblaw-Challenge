//
//  Enums.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation

enum ViewIDs:String{
    case productCellID = "ProductCellID"
    case productCellXIBName = "ProductCell"
    case productDetilsVC = "ProductDetailsVCID"
    
}

enum APIErrors: String
{
    case serverFailed = "Server is not responding contact support."
    case reponseNotFormatted = "JSON response is not valid"
}

struct NotificationNames
{
    static let endRefreshLoading = Notification.Name.init(rawValue: "endRefresh")
}
struct Urls
{
    static let  baseURL = "https://gist.githubusercontent.com/"
    static let middle = "r2vq/2ac197145db3f6cdf1a353feb744cf8e/raw/b1e722f608b00ddde138a0eef2261c6ffc8b08d7/"
    struct Endpoints
    {
        static let cart =  "cart.json"
    }
    
}
struct pricePreFix
{
    static let canada = ""
}

//
//  MenuViewEntity.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import Foundation

struct MenuCategoryRequest: RequestData {
    
    var path: String {
        //ToDO: Change this to real url in live
        guard let urlPath = Bundle.main.url(forResource: "CategoriesList", withExtension: "json") else {
            return ""
        }
        return urlPath.absoluteString
    }
}

struct MenuCategory: Codable {
    let name: String
    let categoryId: Int
}

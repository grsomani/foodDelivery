//
//  MenuListViewInteractor.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import Foundation

class MenuListViewInteractor {
    
    func getCategoriesList(onSuccess: @escaping ([MenuCategory]) -> Void,
                           onError: @escaping (Error) -> Void) {
        //Temp - Change this to use network layer
        let categories = [MenuCategory(name: "Pizza", categoryId: 1),
                          MenuCategory(name: "Sushi", categoryId: 2),
                          MenuCategory(name: "Drinks", categoryId: 3)]
        onSuccess(categories)
    }
    
    func getMenuList(for categoryId: Int,
                     onSuccess: @escaping ([String]) -> Void,
                     onError: @escaping (Error) -> Void) {
        //ToDo - Create Model for Category Details and return
    }
}

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
        
        NetworkManager.instance.performOperation(request: MenuCategoryRequest(),
                                                 reponseType: [MenuCategory].self) { categories in
            onSuccess(categories)
        } onError: { error in
            onError(error)
        }
    }
    
    func getMenuList(for categoryId: Int,
                     onSuccess: @escaping (CategoryDetails) -> Void,
                     onError: @escaping (Error) -> Void) {
        
        NetworkManager.instance.performOperation(request: MenuCategoryDetailsRequest(),
                                                 reponseType: CategoryDetails.self) { categories in
            onSuccess(categories)
        } onError: { error in
            onError(error)
        }
    }
}

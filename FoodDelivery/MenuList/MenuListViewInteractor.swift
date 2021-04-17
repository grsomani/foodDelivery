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
        } onError: { _ in
            //ToDO: Handle error
        }
    }
    
    func getMenuList(for categoryId: Int,
                     onSuccess: @escaping ([String]) -> Void,
                     onError: @escaping (Error) -> Void) {
        //ToDo - Create Model for Category Details and return
    }
}

//
//  MenuListPresenter.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import Foundation

class MenuListPresenter {
    
    let viewDelegate: MenuListViewDelegate
    private let interator = MenuListViewInteractor()
    
    init(viewDelegate: MenuListViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func fetchCategories() {
        self.interator.getCategoriesList { categories in
            DispatchQueue.main.async {
                self.viewDelegate.updateCategories(with: categories)
            }
        } onError: { Error in
            //ToDO: Handle Error
        }
    }
    
    func fetchMenu(for categoryId: Int) {
        self.interator.getMenuList(for: categoryId, onSuccess:{ categoryDetails in
            DispatchQueue.main.async {
                self.viewDelegate.updateItemsList(with: categoryDetails)
            }
        }, onError: { error in
            //ToDO - handle error
        })
    }
}

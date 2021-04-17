//
//  MenuListViewController.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

protocol MenuListViewDelegate {
    func updateCategories(with categories: [MenuCategory])
    func updateItemsList(with categoryDetails: [String])
}

class MenuListViewController: UIViewController {
    
    private var presenter: MenuListPresenter? = nil
    
    private var categoriesList: [MenuCategory]?
    private var menuItems: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MenuListPresenter(viewDelegate: self)
        self.presenter?.fetchCategories()
    }

}

extension MenuListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Special Cell \(indexPath.row)"
        return cell
    }
}

extension MenuListViewController: MenuListViewDelegate {
    
    func updateCategories(with categories: [MenuCategory]) {
        self.categoriesList = categories
        //Reload TopView
        
        //Fetch Items
        guard let firstCategory = self.categoriesList?.first else { return }
        self.presenter?.fetchMenu(for: firstCategory.categoryId)
    }
    
    func updateItemsList(with categoryDetails: [String]) {
        
    }
    
}

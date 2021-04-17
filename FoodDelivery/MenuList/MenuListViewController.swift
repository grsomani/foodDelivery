//
//  MenuListViewController.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

protocol MenuListViewDelegate {
    func updateCategories(with categories: [MenuCategory])
    func updateItemsList(with categoryDetails: CategoryDetails)
}

class MenuListViewController: UIViewController {
    
    @IBOutlet private weak var menuTable: UITableView!
    private var presenter: MenuListPresenter? = nil
    
    private var categoriesList: [MenuCategory]?
    private var categoryDetail: CategoryDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MenuListPresenter(viewDelegate: self)
        self.presenter?.fetchCategories()
    }

}

extension MenuListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDetail?.items.count ?? 0
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
        //ToDO: Reload TopView
        
        //Fetch Items
        guard let firstCategory = self.categoriesList?.first else { return }
        self.presenter?.fetchMenu(for: firstCategory.categoryId)
    }
    
    func updateItemsList(with categoryDetails: CategoryDetails) {
        self.categoryDetail = categoryDetails
        self.menuTable.reloadData()
    }
    
}

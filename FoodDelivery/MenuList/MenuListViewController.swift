//
//  MenuListViewController.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

class MenuListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MenuListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Special Cell \(indexPath.row)"
        return cell
    }
    
    
}

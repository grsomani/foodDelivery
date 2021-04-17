//
//  MenuListViewCell.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

class MenuListViewCell: UITableViewCell {

    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func assign(data: MenuItem) {
        self.imageView?.image = UIImage(named: data.image)
    }
    
}

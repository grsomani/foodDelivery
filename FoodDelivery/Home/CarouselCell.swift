//
//  CarouselCell.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    func configure(with data: HomeViewCarouselData) {
        self.imageView.image = UIImage(named: data.imageName)
    }
}

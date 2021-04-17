//
//  HomeViewPresentor.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import Foundation

class HomeViewPresentor {
    
    let viewDelegate: HomeViewDelegate
    private let interator = HomeViewInteractor()
    
    init(viewDelegate: HomeViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func fetchCarouselData() {
        let carouselData = interator.getCarouselData()
        viewDelegate.setup(carouselData: carouselData)
    }
}

//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

protocol HomeViewDelegate: class {
    func setup(carouselData: [HomeViewCarouselData])
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var carousel: UICollectionView!
    
    private var carouselData = [HomeViewCarouselData]()
    private var presenter: HomeViewPresentor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HomeViewPresentor(viewDelegate: self)
        self.presenter?.fetchCarouselData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as? CarouselCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: carouselData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension HomeViewController: HomeViewDelegate {
    func setup(carouselData: [HomeViewCarouselData]) {
        self.carouselData = carouselData
        self.carousel.reloadData()
    }
}

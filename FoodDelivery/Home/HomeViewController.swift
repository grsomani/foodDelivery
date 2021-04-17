//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Ganesh Somani on 17/04/21.
//

import UIKit

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

protocol HomeViewDelegate: class {
    func setup(carouselData: [HomeViewCarouselData])
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var carousel: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var containerMenuList: UIView!
    @IBOutlet private weak var menuTopContraint: NSLayoutConstraint!

    private var carouselData = [HomeViewCarouselData]()
    private var presenter: HomeViewPresentor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HomeViewPresentor(viewDelegate: self)
        self.presenter?.fetchCarouselData()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.fullScreenMenu))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc func fullScreenMenu() {
        UIView.animate(withDuration: 1.0, animations: {
            self.menuTopContraint.priority = UILayoutPriority(rawValue: 250)
            self.view.layoutIfNeeded()
        }, completion: { finish in
            self.containerMenuList.isUserInteractionEnabled = true
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerMenuList.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func setup(carouselData: [HomeViewCarouselData]) {
        self.carouselData = carouselData
        self.pageControl.numberOfPages = carouselData.count
        self.pageControl.hidesForSinglePage = true
        self.carousel.reloadData()
    }
}

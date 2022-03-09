//
//  StockListCoordibator.swift
//  StocksApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 08/03/22.
//

import UIKit

protocol StockListCoordinatorProtocol: AnyObject {
    func showStockDetails()
}

final class StockListCoordinator: StockListCoordinatorProtocol {

    weak var navigationController: UINavigationController?

    func showStockDetails() {
        // Show stock details in a new screen
    }
}

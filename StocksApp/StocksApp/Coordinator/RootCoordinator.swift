//
//  RootCoordinator.swift
//  StocksApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 08/03/22.
//

import UIKit

final class RootCoordinator {

    static func presentStockList() -> UINavigationController {

        // Preparing the First ViewController
        let stockListCoordinator = StockListCoordinator()
        let stockListInteractor = StockListInteractor()
        let stockListViewModel = StockListViewModel(stockListInteractor: stockListInteractor,
                                                    stockListCoordinator: stockListCoordinator)
        let stockListViewController = StockListViewController(viewModel: stockListViewModel)


        stockListViewController.stockListViewModel = stockListViewModel
        let navigationController = UINavigationController(rootViewController: stockListViewController)
        stockListCoordinator.navigationController = navigationController

        return navigationController
    }
}

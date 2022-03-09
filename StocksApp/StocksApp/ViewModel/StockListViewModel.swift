//
//  StockListViewModel.swift
//  StocksApp


import Foundation

protocol StockListViewModelContract {
    func getListOfStocks(completion: @escaping([StockViewModel]?, Error?)-> ())
}

class StockViewModel {
    var stockName: String
    var percentChange: String
    var priceUsd: String

    // Dependency Injection
    init(_ stock: Stock) {
        self.stockName = stock.name ?? ""
        self.percentChange = String(Double(stock.changePercent24Hr ?? "0.0")?.roundToDecimal(2) ?? 0.0)
        self.priceUsd = String(Double(stock.priceUsd ?? "0.0")?.roundToDecimal(2) ?? 0.0)
    }
}

class StockListViewModel: StockListViewModelContract {
    private let stockListInteractor: StockListInteractorUseCase
    private let stockListCoordinator: StockListCoordinator

    init(stockListInteractor: StockListInteractorUseCase,
         stockListCoordinator: StockListCoordinator) {
        self.stockListInteractor = stockListInteractor
        self.stockListCoordinator = stockListCoordinator
    }

    func getListOfStocks(completion: @escaping ([StockViewModel]?, Error?) -> ()) {
        self.stockListInteractor.getListOfStocks { stocks, error in
            if error != nil {
                completion(nil, error)
            } else {
                let stockVM = stocks?.map{ StockViewModel($0) }
                completion(stockVM, nil)
            }
        }
    }
}

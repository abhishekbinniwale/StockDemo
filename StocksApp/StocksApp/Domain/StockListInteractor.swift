//
//  StockListInteractor.swift
//  StocksApp


import Foundation


protocol StockListInteractorUseCase {
    func getListOfStocks(completion: @escaping([Stock]?, Error?)-> ())
}

class StockListInteractor: StockListInteractorUseCase{
    func getListOfStocks(completion: @escaping ([Stock]?, Error?)-> ()) {
        NetworkManager.sharedInstance.getListOfStocks { stocks, error in
            if error != nil {
                completion(nil, error)
            } else{
                completion(stocks, error)
            }
        }
    }
}

//
//  NetworkManager.swift
//  StocksApp
//
//  Created by Abhishek Madhavrao Binniwale  on 08/03/22.
//

import Foundation

final class NetworkManager {

    static let sharedInstance = NetworkManager()
    private init() {}

    func getListOfStocks(completion: @escaping([Stock]?, Error?)-> ()) {
        let urlString = "https://api.coincap.io/v2/assets?limit=20&offset=0"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                print("fetching data error:\(error)")
            } else {
                guard let data = data else { return }

                do{
                    let stocks = try JSONDecoder().decode(StocksList<[Stock]?>.self, from: data)
                    completion(stocks.data, nil)
                } catch let jsonError {
                    print("Json error:\(jsonError)")
                    completion(nil, jsonError)
                }
            }
        }.resume()
    }
}

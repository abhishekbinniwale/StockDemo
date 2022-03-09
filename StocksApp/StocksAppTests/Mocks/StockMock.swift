//
//  StockMock.swift
//  StocksAppTests
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 09/03/22.
//

import Foundation
@testable import StocksApp

extension Stock {
    static func stub(id: String? = "bitcoin",
                     rank: String? = "1",
                     symbol: String? = "BTC",
                     name: String? = "Bitcoin",
                     supply: String? = "18976737.0000000000000000",
                     maxSupply: String? = "21000000.0000000000000000",
                     marketCapUsd: String? = "747663066351.1259360162796315",
                     volumeUsd24Hr: String? = "11893560938.0458659438012331",
                     priceUsd: String? = "39398.9265041258639995",
                     changePercent24Hr: String? = "0.3924392993660065",
                     vwap24Hr: String? = "38683.2229041533668632",
                     explorer: String? = "https://blockchain.info/") -> Self {

        return Stock(id: id, rank: rank, symbol: symbol, name: name, supply: supply, maxSupply: maxSupply, marketCapUsd: marketCapUsd, volumeUsd24Hr: volumeUsd24Hr, priceUsd: priceUsd, changePercent24Hr: changePercent24Hr, vwap24Hr: vwap24Hr, explorer: explorer)
    }
}

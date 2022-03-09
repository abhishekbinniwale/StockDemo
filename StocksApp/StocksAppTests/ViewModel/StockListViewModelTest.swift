//
//  StockListViewModelTest.swift
//  StocksAppTests
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 09/03/22.
//

import XCTest
@testable import StocksApp

enum StockListError: Error {
    case unknownError
    case connectionError
    case invalidRequest
    case notFound
 }

class StockListViewModelTest: XCTestCase {

    func testStockViewModelSucess() {
        let stockVM = StockViewModel(Stock.stub())
        XCTAssertNotNil(stockVM)
    }

    func testStockViewModelProperties() {
        let stockVM = StockViewModel(Stock.stub())
        XCTAssertEqual(stockVM.stockName, "Bitcoin")
        XCTAssertEqual(stockVM.priceUsd, "39398.93")
        XCTAssertEqual(stockVM.percentChange, "0.39")
    }

    func testgetListOfStockViewModelSucess() {
        let stockListViewModelMock = StockListViewModelMock()
        stockListViewModelMock.expectation = self.expectation(description: "get stock list")
        stockListViewModelMock.error = nil

        stockListViewModelMock.getListOfStocks { stockVM, error in
            XCTAssertNotNil(stockVM)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testgetListOfStockViewModelError() {
        let stockListViewModelMock = StockListViewModelMock()
        stockListViewModelMock.expectation = self.expectation(description: "get stock list")
        stockListViewModelMock.error = StockListError.invalidRequest

        stockListViewModelMock.getListOfStocks { stockVM, error in
            XCTAssertNotNil(error)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}

class StockListViewModelMock: StockListViewModelContract {
    var expectation: XCTestExpectation?
    var error: Error?
    func getListOfStocks(completion: @escaping ([StockViewModel]?, Error?) -> ()) {
        if let error = error {
            completion(nil, error)
        } else {
            let stockVM = [StockViewModel(Stock.stub())]
            completion(stockVM, nil)
        }
        expectation?.fulfill()
    }
}

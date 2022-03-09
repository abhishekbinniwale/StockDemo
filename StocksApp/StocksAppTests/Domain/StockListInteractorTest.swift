//
//  StockListInteractorTest.swift
//  StocksAppTests
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 09/03/22.
//

import XCTest
@testable import StocksApp

class StockListInteractorTest: XCTestCase {

    func testGetListOfStocksSucess() {
        //Create expectation
        let stockListInteractorMock = StockListInteractorMock()
        stockListInteractorMock.expectation = self.expectation(description: "get stock list")
        stockListInteractorMock.error = nil

        stockListInteractorMock.getListOfStocks { stock, error in
            XCTAssertNotNil(stock, "not nil")
        }
        // wait for expectation
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testGetListOfStocksError() {
        //Create expectation
        let stockListInteractorMock = StockListInteractorMock()
        stockListInteractorMock.expectation = self.expectation(description: "get stock list")
        stockListInteractorMock.error = StockListError.invalidRequest

        stockListInteractorMock.getListOfStocks { stock, error in
            XCTAssertNotNil(error)
        }
        // wait for expectation
        waitForExpectations(timeout: 5, handler: nil)
    }
}

class StockListInteractorMock: StockListInteractorUseCase{
    var expectation: XCTestExpectation?
    var error: Error?
    func getListOfStocks(completion: @escaping ([Stock]?, Error?) -> ()) {
        if let error = error {
            completion(nil, error)
        } else {
            let stockVM = [Stock.stub()]
            completion(stockVM, nil)
        }
        expectation?.fulfill()
    }
}

//
//  StockListTableViewCell.swift
//  StocksApp
//
//  Created by Abhishek Madhavrao Binniwale (BLR GSS) on 08/03/22.
//

import UIKit

class StockListTableViewCell: UITableViewCell {

    @IBOutlet weak var stockListNumberLabel: UILabel!
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var stockPercentageChangeLabel: UILabel!
    @IBOutlet weak var stockPricelabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(index: Int, stock: StockViewModel) {
        self.stockListNumberLabel.text = "\(index)"
        self.stockNameLabel.text = stock.stockName
        self.stockPercentageChangeLabel.text = stock.percentChange
        self.stockPricelabel.text = stock.priceUsd
    }
}

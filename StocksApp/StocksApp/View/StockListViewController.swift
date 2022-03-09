//
//  StockListViewController.swift
//  StocksApp


import UIKit

class StockListViewController: UIViewController {

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var stockList: [StockViewModel]?
    private let cellIdentifier = "StockListTableViewCell"
    private var timer = Timer()

    var stockListViewModel: StockListViewModelContract?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.getData()
        scheduledTimerWithTimeInterval()
    }

    init(viewModel: StockListViewModelContract) {
        self.stockListViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "getData" with the interval of 10 seconds
        timer = Timer.scheduledTimer(timeInterval: 10, target: self,
                                     selector: #selector(self.getData),
                                     userInfo: nil, repeats: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.timer.invalidate()
    }

    func setUpUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.stockListViewModel = StockListViewModel(stockListInteractor: StockListInteractor(),
                                                     stockListCoordinator: StockListCoordinator())
    }

    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    @objc func getData() {
        print("getData called")
        self.stockListViewModel?.getListOfStocks { [weak self] (stocks, error) in
            guard let self = self else { return }
            if error != nil {
                // can show error screen
            } else {
                self.stockList = stocks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension StockListViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as! StockListTableViewCell
        if let stock = stockList?[indexPath.row] {
            cell.configureCell(index: indexPath.row + 1, stock: stock)
        }
        return cell
    }
}

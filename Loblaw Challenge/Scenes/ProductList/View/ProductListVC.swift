//
//  ProductListVC.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import UIKit

class ProductListVC: UIViewController {

    @IBOutlet weak var productListTableView:UITableView!
    
    var adapter : ProductListAdapter!
    var refreshControl = UIRefreshControl()
    lazy var viewModel: ProductListViewModel = {
        return ProductListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAdapter()
        setupViewModel()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    /// seting up adapter
    fileprivate func setupAdapter()
    {
        adapter = ProductListAdapter(delegate: self)
        productListTableView.delegate = adapter
        productListTableView.dataSource = adapter
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.reloadTableViewData(_:)), for: .valueChanged)
        productListTableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    /// Setup UI for inital UI
    fileprivate func setupUI()
    {
        self.navigationItem.title = "Product List"
        self.productListTableView.tableFooterView = UIView.init()
        
    }
    
    /// Intial ViewModel setup
    fileprivate func setupViewModel()
    {
        // Setup for reloadTableViewClosure
        viewModel.endRefreshTableClosure = {
            self.refreshControl.endRefreshing()
        }
        viewModel.reloadTableViewClosure = {
            DispatchQueue.main.async {
                print("GOing in here")
                self.productListTableView.reloadData()
            }
        }
            // Setup for updateLoadingStatusClosure
            viewModel.updateLoadingStatusClosure = { [weak self] () in
                DispatchQueue.main.async {
                    let isLoading = self?.viewModel.isLoading ?? false
                    if isLoading {
                        print(#line,#file)
                        UIView.animate(withDuration: 0.2, animations: {
                            self?.productListTableView.alpha = 0.0
                        })
                    } else {
                        print(#line,#file)
                        UIView.animate(withDuration: 0.2, animations: {
                            self?.productListTableView.alpha = 1.0
                        })
                    }
                }
            }
            
            viewModel.fetchData()
        }
    
    /// Refreshing data from server.
    @objc func reloadTableViewData(_ sender: AnyObject) {
        viewModel.fetchData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension  ProductListVC : ProductListProtocol
{
    func getData(at: IndexPath) -> Product {
       
        return self.viewModel.getData(at: at)
    }
    
    func itemSelected(at indexPath: IndexPath) {
        // go to Detail VC
        viewModel.selectedProduct = self.viewModel.getData(at: indexPath)
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let productDetailsVC = mainStoryboard.instantiateViewController(identifier: ViewIDs.productDetilsVC.rawValue) as? ProductDetailsVC
        {
            productDetailsVC.product = viewModel.selectedProduct
            self.navigationController?.pushViewController(productDetailsVC, animated: true)
        }
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ViewIDs) as? IKDetailVC
//
    }
    
    func retrieveNumberOfSections() -> Int {
        return 1
    }
    
    func retrieveNumberOfItems() -> Int {
        return self.viewModel.numberOfItems
    }
    
    
}

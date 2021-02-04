//
//  ProductListViewModel.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation

class ProductListViewModel {

    // MARK: - Closures
    
    // Through these closures, our view model will execute code while some events will occure
    // They will be set up by the view controller
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatusClosure: (()->())?
    var endRefreshTableClosure: (()->())?
    
    // MARK: - Properties
    
    // We defined the FakeAPIServiceProtocol in the FakeAPIService.swift file.
    // We also defined a class and make it conform to that protocol.
    let apiService: ProductAPIProtocol

    // This will contain info about the picture eventually selectded by the user by tapping an item on the screen
    var selectedProduct: Product?
    
    // The collection that will contain our fetched data
    private var products: [Product] = [Product]() {
        didSet {
            print(#line,#file)
            self.reloadTableViewClosure?()
        }
    }
    
    // A property containing the number ot items, it will be used by the view controller to render items on the screen using a
    var numberOfItems: Int {
        return products.count
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatusClosure?()
        }
    }
    
    // MARK: - Constructor
    
    // Note: apiService has a default value in case this constructor is executed without passing parameters
    init( apiService: ProductAPIProtocol = ProductAPIService()) {
        self.apiService = apiService
    }
    
    
    // MARK: - Fetching functions
    
    func fetchData() {
        self.isLoading = true
        apiService.getProductList(complete: {
            (success, products, error) in
            if let error = error {
                print ("Error: \(error.rawValue)")
            } else {
                if let productsArray = products?.entries
                {
                    self.products = productsArray
                    self.endRefreshTableClosure?()
                }
               
            }
            
            self.isLoading = false
        })
            
           
        }
    
    
    // MARK: - Retieve Data
    
    func getData( at indexPath: IndexPath ) -> Product {
        return products[indexPath.row]
    }
}

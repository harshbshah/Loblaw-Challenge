//
//  ProductListAdapter.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation
import UIKit
class ProductListAdapter: NSObject {

    let delegate: ProductListProtocol

    // MARK: - Constructor

    init(delegate:ProductListProtocol) {
        self.delegate = delegate
    }
}

// MARK: - UITableViewDataSource Delegate implementation

extension ProductListAdapter: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: ViewIDs.productCellXIBName.rawValue, bundle: nil), forCellReuseIdentifier: ViewIDs.productCellID.rawValue)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewIDs.productCellID.rawValue, for: indexPath) as? ProductCell else {
            fatalError("Cell not exists in storyboard")
        }
        
        cell.product = delegate.getData(at: indexPath )
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate.retrieveNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.retrieveNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        delegate.itemSelected(at: indexPath)
        return nil
    }

}


//
//  ProductListProtocol.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation
protocol ProductListProtocol {
    func getData(at: IndexPath)->Product
    func itemSelected(at indexPath: IndexPath)
    func retrieveNumberOfSections()->Int
    func retrieveNumberOfItems()->Int
    
}

//
//  ProductAPIs.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import Foundation
import Alamofire

protocol ProductAPIProtocol: AnyObject {
    func getProductList( complete: @escaping ( _ success: Bool, _ products: ProductList?, _ error: APIErrors? )->() )
}

// Declare the FakeAPIService class an make it conform to the FakeAPIServiceProtocol.
// Doing this we can easily assign this protocol in the PictureListViewController
class ProductAPIService: ProductAPIProtocol {
    
    private let productListURL = Urls.baseURL + Urls.middle + Urls.Endpoints.cart
    
    func getProductList( complete: @escaping ( _ success: Bool, _ products: ProductList?, _ error: APIErrors? )->() ) {
        
        AF.request(productListURL).responseJSON{
            response in
            switch response.result{
            case .success(let responseData):
                
                do {
                    if let responseData = response.data
                    {
                        let response = try JSONDecoder().decode(ProductList.self, from: responseData)
                        complete(true,response,nil)
                    }
                    
                }
                catch {print(error)
                    complete(false, nil, APIErrors.reponseNotFormatted)
                }
            
                    
                
            case .failure(let error):
                print(error)
            complete(false, nil, APIErrors.serverFailed)
                //Failed
            }
            }
        }
        // Use a dispatch queue that schedules tasks for concurrent execution.
      
}

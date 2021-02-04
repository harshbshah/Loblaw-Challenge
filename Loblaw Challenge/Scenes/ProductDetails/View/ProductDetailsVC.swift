//
//  ProductDetailsVC.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-03.
//

import UIKit

class ProductDetailsVC: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var product: Product?{
        didSet{
            setData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// Setup UI for inital UI 
    fileprivate func setupUI()
    {
        
    }
    
    /// Setup Data from server
    fileprivate func setData()
    {
        if let product = product
        {
            DispatchQueue.main.async {
                if let imageURL = product.image
                {
                    self.productImageView.sd_setImage(with: URL.init(string: imageURL), completed: {_,_,_,_ in
                        //TO DO: adding error block
                        print("Image Downloaded")
                    })
                }
                if let productName = product.name
                {
                    self.productNameLabel.text = productName
                }
                if let productPrice = product.price
                {
                    self.productPriceLabel.text = productPrice
                }
                if let productType = product.type
                {
                    self.productTypeLabel.text = productType
                }
            
        }
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
}

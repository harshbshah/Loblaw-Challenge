//
//  ProductCell.swift
//  Loblaw Challange
//
//  Created by Harsh Shah on 2021-02-02.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImageView:UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    ///providing data to display
    var product:Product?
    {
        
        didSet{
            print(#line,#file)
            if let imageURL = self.product?.image
            {
            if let productURL = URL.init(string: imageURL)
            {
                self.productImageView.sd_setImage(with: productURL, completed: {_,_,_,_ in
                    print("Image loaded")
                    self.productImageView.contentMode = .scaleAspectFit
                    self.productImageView.backgroundColor = .clear
                })
            }
                
            }
            if let price = self.product?.price
            {
                self.productPriceLabel.text = "\(pricePreFix.canada)\(price)"
            }
            if let name = self.product?.name
            {
                self.productNameLabel.text = "\(name)"
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// When the UI updates
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    /// Setup UI for inital UI
    func setupUI()
    {
        self.cellView.layer.cornerRadius = 4.0
        self.cellView.applyTableViewCellShadow()
//        self.productImageView.layer.cornerRadius = self.productImageView.frame.height / 2
    }
    
}

/// TO DO: need to put in seprate file.
extension UIView
{
    func applyTableViewCellShadow()
    {
        self.layer.shadowColor = UIColor.darkGray.cgColor

        
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)

        
        self.layer.shadowRadius = 4.0

      
        self.layer.shadowOpacity = 1.0
    }
}

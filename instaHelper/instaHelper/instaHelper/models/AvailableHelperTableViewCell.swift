//
//  AvailableHelperTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

protocol DetailsDelegate: AnyObject {
    func didSelectCell(with data: Int)
}

class AvailableHelperTableViewCell: UITableViewCell {
    
    weak var delegate: DetailsDelegate?
    
    @IBOutlet weak var helperImage: UIImageView!
    @IBOutlet weak var experienceofHelper: UILabel!
    @IBOutlet weak var nameofHelper: UILabel!
    @IBOutlet weak var genderofHelper: UILabel!
    @IBOutlet weak var ratingHelper: UILabel!
    @IBOutlet weak var reviewsOfHelper: UILabel!
    var servantId = 0;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("Delegate \(servantId)")
        delegate?.didSelectCell(with: servantId)
    }
    func update(with servant: Int) {
        servantId = servant
        guard let selectedServant = ServantDataModel.shared.getServant(by: servant) else {
            print("Servant not found")
            return
        }
        
        nameofHelper.text = selectedServant.name
        reviewsOfHelper.text = String(selectedServant.numberOfReviews)
        
        // Servant Image
        helperImage.image = UIImage(named: selectedServant.image)
        
        experienceofHelper.text = "\(selectedServant.experience) years of experience"
        
        ratingHelper.text = String(selectedServant.rating)
        
        genderofHelper.text = selectedServant.gender
    }
}

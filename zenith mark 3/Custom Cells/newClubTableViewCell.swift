//
//  newClubTableViewCell.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/12/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class newClubTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var buttonLabel: UIButton!
    
   
    
    
    @IBAction func buttonPressed(_ sender: Any) {
         
    }
    
    
    
    
    static let identifier = "newClubTableViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: "newClubTableViewCell", bundle: nil)
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configureWith(with model: newClub) {
        
        
        self.buttonLabel.setTitle(model.clubName, for: .normal)
      
        self.buttonLabel.titleLabel?.font = UIFont.init(name: "Kollektif", size: 25.0)
        
        self.buttonLabel.titleLabel?.minimumScaleFactor = 0.5
        self.buttonLabel.titleLabel?.numberOfLines = 1

        self.buttonLabel.titleLabel?.adjustsFontSizeToFitWidth = true
}


}

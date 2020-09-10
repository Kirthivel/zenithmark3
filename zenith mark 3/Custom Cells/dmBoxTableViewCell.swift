//
//  dmBoxTableViewCell.swift
//
//
//  Created by Arkaprabho Bose on 7/31/20.
//

import UIKit

class dmBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var clubNameLabel: UIButton!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    static func nib() -> UINib {
        
        return UINib(nibName: "dmMesssagebox", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(with model: clubName) {
    
        self.clubNameLabel.setTitle(model.club, for: .normal)
        self.clubNameLabel.titleLabel?.font = UIFont.init(name: "Kollektif", size: 25.0)
        
        
        
    }

}

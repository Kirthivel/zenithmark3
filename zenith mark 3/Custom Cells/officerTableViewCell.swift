//
//  officerTableViewCell.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 8/21/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class officerTableViewCell: UITableViewCell {

         @IBOutlet weak var clubNameLabel: UIButton!
        
         
         
         override func awakeFromNib() {
             super.awakeFromNib()
             // Initialization code
         }
        
         static func nib() -> UINib {
             
             return UINib(nibName: "officerBox", bundle: nil)
         }

         override func setSelected(_ selected: Bool, animated: Bool) {
             super.setSelected(selected, animated: animated)

             // Configure the view for the selected state
         }
         
         func configureWith(with model: outName) {
         
             self.clubNameLabel.setTitle(model.club, for: .normal)
             self.clubNameLabel.titleLabel?.font = UIFont.init(name: "Kollektif", size: 25.0)
             
             
             
         }

     }

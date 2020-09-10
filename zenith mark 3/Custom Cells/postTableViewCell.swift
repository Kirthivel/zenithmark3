//
//  postTableViewCell.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 7/7/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

class postTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    
    @IBOutlet var heartButton: UIButton!
    @IBOutlet weak var thumbsUp: UIButton!
    @IBOutlet weak var thumbsDown: UIButton!
    @IBOutlet weak var clapButton: UIButton!
    
    var test: Bool = true
    
    
    @IBAction func liked(_ sender: Any) {
        
        
    
        
        if(test==true) {
        test = false
        heartButton.backgroundColor = UIColor.orange
        
        }
        
        else {
            test = true
            heartButton.backgroundColor = UIColor.clear
            
        }
        
        
        
        
        
        
//
//        if(test == false) {
//            test = true
//            thumbsUp.titleLabel?.text = "👍"
//            thumbsDown.titleLabel?.text = "👎"
//            clapButton.titleLabel?.text = "👏"
//
//        }
//
//        else {
//            test = false
//            thumbsUp.titleLabel?.text = ""
//            thumbsDown.titleLabel?.text = ""
//            clapButton.titleLabel?.text = ""
//
//
//        }
        
    }
    
    

    static let identifier = "postTableViewCell"
    
    
    
    static func nib() -> UINib {
        
        
        return UINib(nibName: "postTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func configureWithModel(with model: zenithPost){
        
       
        self.likesLabel.text = model.caption
        self.usernameLabel.text = model.username
        self.postImageView.image = UIImage(named: model.postImageName)
        self.userImageView.image = UIImage(named: model.userImageName)
        
        
        
    }
    
}

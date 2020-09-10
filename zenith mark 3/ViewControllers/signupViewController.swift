//
//  signupViewController.swift
//  zenith mark 3
//
//  Created by Arkaprabho Bose on 6/9/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//
import FirebaseFirestore
import UIKit
import FirebaseAuth
import Firebase

class signupViewController: UIViewController {
    
    
    

    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var gifView2: UIImageView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var gifView4: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView2?.loadGif(name: "login")
         gifView4?.loadGif(name: "login")
        // Do any additional setup after loading the view.
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


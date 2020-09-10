//
//  testerViewController.swift
//  zenithmark3
//
//  Created by Arkaprabho Bose on 8/12/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class testerViewController: UIViewController {
    
    let db = Firebase.Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
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
    @IBAction func buttonTapped(_ sender: Any) {
        
        print("Start")
        db.collection("Test").addDocument(data: ["Test":"Test"])
        
         print("Finish")
    }
    
}

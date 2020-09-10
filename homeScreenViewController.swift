//
//  homeScreenViewController.swift
//
//
//  Created by Arkaprabho Bose on 7/7/20.
//

import UIKit
import FirebaseAuth
import Firebase


class homeScreenViewController: UITableViewController {
       
    let db = Firebase.Firestore.firestore()

    
    
    @IBOutlet var table: UITableView!
    

    
     
    
    @IBAction func refresh(_ sender: Any) {
        
        models.append(zenithPost(caption: "Here is our club vounteering at the jlksjfdk old age home, we had lots of fun and saved some old people from dying", username: "NHS", userImageName: "Pfp", postImageName: "volunteer", likes:0))
        
        
        table.reloadData()
        
        refreshControl?.endRefreshing()
    
        
    }
    var models = [zenithPost]()
    

   

    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        DatabaseManager.shared.test()
       
        db.collection("Test").addDocument(data: ["Test" : "Test"])
        print("Test")
       
        
    
        
        table.register(postTableViewCell.nib(), forCellReuseIdentifier: postTableViewCell.identifier)
       
       
        
        models.append(zenithPost(caption: "Here is our club vounteering at the jlksjfdk old age home, we had lots of fun and saved some old people from dying", username: "NHS", userImageName: "Pfp", postImageName: "volunteer", likes: 0))
        models.append(zenithPost(caption: "Insert Caption", username: "CRHS Key Club", userImageName: "Pfp", postImageName: "volunteer",likes:0))
        models.append(zenithPost(caption: "Insert Caption", username: "FBLA", userImageName: "Pfp", postImageName: "volunteer",likes:0))
         
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        db.collection("Test").addDocument(data: ["Test" : "Test"])
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil{
            let vc = loginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    

               
 
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        
        view.tintColor = UIColor.init(displayP3Red: 0.684, green: 0.839, blue: 0.843, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.center
        header.textLabel?.font = UIFont.init(name: "Kollektif-Bold", size: 30.0)
        header.textLabel?.textColor = UIColor.black
        
        
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                    return "HOME"
                }
    
 
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: postTableViewCell.identifier, for: indexPath) as! postTableViewCell
        cell.configureWithModel(with: models[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return  view.frame.size.width + 120

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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

struct zenithPost {
    
    let caption: String
    let username: String
    let userImageName: String
    let postImageName: String
    let likes: Int
    
    
    
    
}


//
//  loginViewController.swift
//  zenith mark 3
//
//  Created by Arkaprabho Bose on 6/9/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit

import FirebaseFirestore
import FirebaseAuth
import Firebase
import FirebaseUI
import FirebaseDatabase
import GoogleSignIn
import AuthenticationServices
import FacebookCore
import FBSDKLoginKit
import FacebookLogin
import MSAL


class loginViewController: UIViewController, LoginButtonDelegate{
    
    
    @IBOutlet weak var emailTextField: UITextField!
    

    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var google: GIDSignInButton!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var gifView2: UIImageView!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var appleView: UIView!
    
    
    @IBOutlet weak var googButtonView: UIView!
    
    @IBOutlet weak var registerButtonView: UIButton!
    
    @IBOutlet weak var fbButtonView: UIView!
    
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loads GIf
        gifView?.loadGif(name: "login")
        gifView2?.loadGif(name: "login")
        
        //Google Button + Sign in
        let goog = GIDSignInButton()
       view.addSubview(goog)
        goog.center = view.center
        GIDSignIn.sharedInstance()?.presentingViewController = self
    
        
        
        
        //fb button + sign in
        let loginButton = FBLoginButton()
        loginButton.delegate=self
        loginButton.permissions = ["public_profile", "email"]
        if let token = AccessToken.current{
            print("Use has successfully logged in with Facebook")
            print(token)
            firebaseFacebookLogin(accessToken: token.tokenString)
            
            
        }
        loginButton.heightAnchor.constraint(equalToConstant: 60.0)
        loginButton.center = fbButtonView.center
        loginButton.widthAnchor.constraint(equalTo: fbButtonView.widthAnchor, multiplier: 1)
        view.addSubview(loginButton)
        
        //Creating a database reference object
        //loginButton.widthAnchor.constraint(equalTo: google.widthAnchor)
        //GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view.
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
          print(error.localizedDescription)
          return
        }
        let fb_credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signInAndRetrieveData(with: fb_credential) { (authResult, error) in
            if error == nil {
                print("Successfully logged in")
                self.firebaseFacebookLogin(accessToken: AccessToken.current!.tokenString)
                //self.loginButtonDidCompleteLogin(loginButton, result:LoginResult)
            }else{
                print(error?.localizedDescription)
                return
            }
        }
    }
    
    
 
    
    func loginButtonDidCompleteLogin(_ loginButton: FBLoginButton, result: LoginResult){
        print("User logged in")
        
        switch result {
        case .failed(let err):
            print(err)
        case .cancelled:
            print("cancelled")
        case .success(let grantedPermissions, let declinedPermissions, let token):
            print("success!!")
            print(token)
//            firebaseFacebookLogin(accessToken: token.tokenString)
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User has successfully logged out")
    }
    
   
    
    
    
    func firebaseFacebookLogin(accessToken: String){
        let fb_credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        Auth.auth().signIn(with: fb_credential, completion: { (authResult, error) in
          if let error = error {
              print("Firebase Login Error")
              print(error)
              return
          }else{ //User has signed in successfully to Firebase using Facebook
              print("Firebase login done!")
            print(authResult as Any)
            
            
            
          
            
            print("the current user is a new user",authResult!.additionalUserInfo!.isNewUser)
            
//
//            if((authResult?.additionalUserInfo?.isNewUser) == true) {
//
//                let mainTab = self.storyboard?.instantiateViewController(identifier: "handleVC") as? createUsernameViewController
//
//                self.navigationController?.pushViewController(mainTab!, animated: true)
//
//          }
//
//          else  {
//
//                let mainTab = self.storyboard?.instantiateViewController(identifier: "mainTabVC") as? tabBarViewController
//
//                self.navigationController?.pushViewController(mainTab!, animated: true)
//
//
//
//
//            }
//
            
            
              if let user = Auth.auth().currentUser {
                  print("The current firebase user is: ")
                  print(user)
              }
          }
      })
      // ...
    }
   func logOut() {
    
    
     
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func loginwithGoogle(_ sender: Any)
    {
        print("test2")
        GIDSignIn.sharedInstance().signIn()
        
        
    }
    
    @IBAction func loginTapped(_ sender: Any)
    {
        
        
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any)
    {
        print("Register button tapped")
    }
    

//    override func viewDidAppear(_ animated: Bool) {
//
//      let  authUI = FUIAuth.defaultAuthUI()
//      let providers: [FUIAuthProvider] = [FUIFacebookAuth()]
//      authUI!.providers = providers
//
//      let authViewController = authUI!.authViewController()
//      self.present(authViewController,animated: true, completion: nil)
//
//    }
    
    
}

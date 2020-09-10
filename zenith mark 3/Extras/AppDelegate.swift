//
//  AppDelegate.swift
//  zenith mark 3
//
//  Created by Arkaprabho Bose on 6/9/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//



//  AppDelegate.swift




    

import UIKit
import Firebase
import GoogleSignIn
import FirebaseCore
import FBSDKLoginKit
import FBSDKCoreKit
import FacebookCore
import MSAL


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate
{

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        ApplicationDelegate.shared.application(application,didFinishLaunchingWithOptions: launchOptions)
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    @available(iOS 9.0,*)

  // Inside AppDelegate...

          
         
    
    
    
 


    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool
    {
        // When called, this method properly handles the URL that Zenith receives at the end of the authentication process
    
        ApplicationDelegate.shared.application(
                application,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    
        
        return GIDSignIn.sharedInstance().handle(url) 
         

    }
    //Facebook Authentication
    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!)
    {
      if let error = error {
        print(error.localizedDescription)
        return
      }else{
        print(error?.localizedDescription)
        }
    }
    
    // This next chunk of code tells Zenith how to implement GIDSignIn protocol in the sign-in process (GOOGLE)
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if let error=error
        {
            return
        }
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        FirebaseAuth.Auth.auth().signInAndRetrieveData(with: credential) {[weak self] (result, error) in
            guard let strongSelf = self else{
                return
            }
            if error == nil {
                print(result?.user.email)
                print(result?.user.displayName)
            }else{
                print(error?.localizedDescription)
            }
            let user = result?.user
            
        }
    }
    

    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // If any of you wants to put a fun and quirky disconnect user thingy here, tell me and I'll put it in for you
    }
    
    
    
    
    
}


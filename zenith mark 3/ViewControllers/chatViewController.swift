//
//  chatViewController.swift
//  zenithmark3
//
//  Created by Sriabhi Venkat on 8/8/20.
//  Copyright © 2020 Zenith Technologies. All rights reserved.
//

import UIKit
import MessageKit
import Firebase
import FirebaseFirestore
import InputBarAccessoryView
import SDWebImage


class chatViewController: MessagesViewController, InputBarAccessoryViewDelegate, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate{
    
    
    var currentUser = Auth.auth().currentUser!
    private var docReference: DocumentReference?
    var messages: [Message]=[]
    
    var user2name: String?
    var user2ImgUrl: String?
    var user2UID: String?
    let db = Firebase.Firestore.firestore()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db.collection("Chats").addDocument(data: ["Message" : "Test"], completion: nil)
        print("Chat added")
        //connecting our delegates to the viewdidload method
        self.title = user2name ?? "Chat"
        navigationItem.largeTitleDisplayMode = .never
        maintainPositionOnKeyboardFrameChanged = true
        messageInputBar.inputTextView.tintColor = .black
        messageInputBar.sendButton.setTitleColor(.blue, for: .normal)
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        loadChat()
       
      
        tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    func createNewChat() {
        //we call this method if there's not a chat available for a current user
        let users = [self.currentUser.uid, self.user2UID]
        let data: [String: Any] = [
            "users": users
        ]
        
        
//        let db = Firestore.firestore().collection("Chats")
        db.collection("Chats").addDocument(data: data) { (error) in
            if let error = error {
                print("Unable to create chat: \(error)")
                return
            }else{
                self.loadChat()
            }
        }
    }
    func loadChat() {
        //Call all the chats that have our current user in it
//        let db = Firestore.firestore().collection("Chats").whereField("users", arrayContains: Auth.auth().currentUser?.uid ?? "Not found User1")
        db.collection("Chats").whereField("users",arrayContains: Auth.auth().currentUser?.uid ?? "Not found User1")
        
        
        db.collection("Chats").getDocuments { (chatQuerySnap, error) in
            if let error = error {
                print("Error: \(error)")
                return
            } else {
                guard let queryCount = chatQuerySnap?.documents.count else {
                    return
                }
                if queryCount == 0 {
                    //if we dont have any chats right now, we need to create one
                    self.createNewChat()
                }
                else if queryCount >= 1{
                    //if we have 1 or less chats
                    for docs in chatQuerySnap!.documents {
                        let chat = Chat(dictionary: docs.data())
                        if(chat?.users.contains(self.user2UID!))! {
                            self.docReference = docs.reference
                            docs.reference.collection("threads")
                            .order(by: "created", descending: false)
                            .addSnapshotListener(includeMetadataChanges: true, listener: {(threadQuery, error) in
                                    if let error = error {
                                        print("error: \(error)")
                                        return
                                    }else{
                                        self.messages.removeAll()
                                        for message in threadQuery!.documents {
                                            let msg = Message(dictionary: message.data())
                                            self.messages.append(msg!)
                                            print("Data: \(msg?.content ?? "No message found")")
                                        }
                                        self.messagesCollectionView.reloadData()
                                        self.messagesCollectionView.scrollToBottom(animated: true)
                                }
                                })
                            return
                        } //end of our if statement
                    } // end of our for loop
                    self.createNewChat()
                }else{
                    print("If this error prints, I'm going to kill myself.")
                }
            }
        }
    }
    
    private func insertNewMessage(_ message: Message) {
        //when our dude sends a message, it adds it to our message array and reloads our Firestore database to include our new message
        messages.append(message)
        messagesCollectionView.reloadData()
        DispatchQueue.main.async {
            self.messagesCollectionView.scrollToBottom(animated: true)
        }
    }
    
    private func save(_ message: Message){
        //preparing our data to be sent to our Firestore collection "Chats"
        let data: [String: Any] = [
            "content": message.content,
            "created": message.created,
            "id": message.id,
            "senderID": message.senderID,
            "senderName": message.senderName
        ]
        //writing chat data to the thread using the document reference we saved in the loadChat function (will send to cloud after)
        docReference?.collection("threads").addDocument(data: data, completion: { (error) in
            if let error = error {
                print("Error Sending Message: \(error)")
                return
            }
            self.messagesCollectionView.scrollToBottom()
        })
    }
    
    //I'm going to implement the delegates now so I'm not getting that pesky error up at the top when I'm extending the viewController with all the layout stuff
    
    
    //Implementing InputBarAccessoryViewDelegate
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        //when u press ur send button to add our data to the messages array, we call this method
        let message = Message(id: UUID().uuidString, content: text, created: Timestamp(), senderID: currentUser.uid, senderName: currentUser.displayName!)
        
        //we're going to call our private fucntions now!!!! happy day
        insertNewMessage(message)
        save(message)
        
        //we have to clear the input field or else we'll have all our old messages stacked on top of one another - and that's no fun :/
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
    //Implementing MessagesDataSource
    func currentSender() -> SenderType {
        return Sender(id: Auth.auth().currentUser!.uid, displayName: Auth.auth().currentUser?.displayName ?? "Name not found")
    }
    //lets set up the structure that our message data should take as defined in Message.swift
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section] as! MessageType
    }
    //Let's get a message count in this thread, can delete later if it's taking up too much space, jus a cool lil number if we end up getting a large number
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        if messages.count == 0{
            print("You don't have any messages. It's time to find some friends >:)")
            return 0
        }else{
            return messages.count
        }
    }
    
    //Implementing MessagesLayoutDelegate
    //We're going to implement the size of the dude's avatar pic
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }
    
    
    //MessagesDisplayDelegate
    //Background color of bubble
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .blue: .lightGray
    }
    //shows the avatar
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        //if its the current user, show their avatar
        if message.sender.senderId == currentUser.uid {
            SDWebImageManager.shared.loadImage(with: currentUser.photoURL, options: .highPriority, progress: nil) { (image, data, error, cacheType, isFinished, imageUrl) in
            avatarView.image = image
            }
        }else{
            SDWebImageManager.shared.loadImage(with: URL(string: user2ImgUrl!), options: .highPriority, progress: nil) { (image, data, error, cacheType, isFinished, imageUrl) in
                avatarView.image = image
            }
        }
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

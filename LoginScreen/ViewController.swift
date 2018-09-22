//
//  ViewController.swift
//  LoginScreen
//
//  Created by Swift on 22/09/2018.
//  Copyright © 2018 quaddro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let nc = NotificationCenter.default
    
    @IBOutlet weak var imageLogin: UIImageView!
    
    @IBOutlet weak var textFieldUser: UITextField!
    
    
    @IBOutlet weak var textFieldPass: UITextField!
    
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        registerNotifications()

    }

    override func viewDidDisappear(_ animated: Bool) {
        removeNotifications()
    }
    
    func registerNotifications(){
        nc.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: .main) {[weak self] (notification) in
            dump(notification)
            
            if let keyBoardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
                
                self?.view.frame.origin.y = -keyBoardSize.height
                
            }
            
        }
        
        nc.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: .main) { [weak self] (notification) in
            self?.view.frame.origin.y = 0
        }
        
    }
    
    func removeNotifications(){
        
        nc.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil)
        nc.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil)
        
    }


}


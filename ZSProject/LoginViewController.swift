//
//  ViewController.swift
//  ZSProject
//
//  Created by Rafat Touqir Rafsun on 7/15/16.
//  Copyright © 2016 Rafat Touqir Rafsun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textfieldUsername: UITextField!
    
    @IBOutlet weak var textfieldPassword: UITextField!
    //textfield related properties
    var activeTextField:UITextField?
    let keyboardExtraPadding:CGFloat = 5
    var GlobalMainQueue: dispatch_queue_t {
        return dispatch_get_main_queue()
    }
    
    func dispatchTimeInSecond(delayInSeconds seconds:Double = 0.0) -> dispatch_time_t{
        return dispatch_time(DISPATCH_TIME_NOW,
                             Int64(seconds * Double(NSEC_PER_SEC)))
    }
    
    
    
    
    
    
    
    @IBOutlet weak var buttonSignIn: UIButton!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        
        
        self.hideKeyboardWhenTappedAround()
        
        textfieldUsername.delegate = self
        textfieldPassword.delegate = self
        
        buttonSignIn.addTarget(self, action: #selector(buttonSignInTapped), forControlEvents: .TouchUpInside)
        
        
    }
    
    func buttonSignInTapped(button:UIButton) {
        
        guard let username = textfieldUsername.text,password = textfieldPassword.text where !username.isEmpty && !password.isEmpty else{
            Helper.showToast(message: Strings.LOGIN_ALERT)
            return
        }
        
        
        activityIndicator.startAnimating()
        ConnectionHelper.instance.load(Urls.URL_LOGIN,params: ["username":username,"password":password], responseBlock: { (json:JSON?,errorStr:String?) in
            
            
            self.activityIndicator.stopAnimating()
            if let json = json{
                
                //Login response
                
                if let auth_key = json["key"].string where !auth_key.isEmpty{
                    
                    Helper.showToast(message: Strings.LOGIN_SUCCESSFUL)
                    UserDefaultsHandler.save(Strings.UD_USER_TOKEN, value: auth_key)
                    UserDefaultsHandler.synchronize()
                    
                    
                    let detailNavViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailNavViewController")
                    
                    self.presentVC(detailNavViewController!)
                    
                    
                }else{
                    
                    Helper.showToast(message: Strings.UNAUTHORIZED_USERPASSWORD_MISSMATCH)
                }
                
            }else{
                Helper.showToast(message: errorStr)
            }
            
            
            
        })
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//MARK :- MY KEYBOARD SWIPE UP EXTENSION
extension LoginViewController:UITextFieldDelegate{
    
    //App related delegate implementation here
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        switch textField {
        case textfieldUsername:
            textfieldPassword.becomeFirstResponder()
        case textfieldPassword:
            textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    
    //keyboard slide up implementation start here
    func textFieldDidBeginEditing(textField: UITextField){
        activeTextField = textField
        
        if let activeTextField = activeTextField{
            let rectToScroll = CGRect(x: activeTextField.frame.origin.x, y: activeTextField.frame.origin.y , width: activeTextField.frame.size.width, height: activeTextField.frame.size.height + keyboardExtraPadding)
            
            //Patch to work the scroll with padding
            let popUpTime = dispatchTimeInSecond(delayInSeconds: 0.1)
            dispatch_after(popUpTime, GlobalMainQueue) {
                self.scrollView.scrollRectToVisible(rectToScroll, animated: true)
            }
            
        }
        
    }
    
    
    func textFieldDidEndEditing(textField: UITextField){
        activeTextField = nil
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unRegisterFromKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unRegisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size{
            
            
            let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            
            if let activeTextField = activeTextField{
                let rectToScroll = CGRect(x: activeTextField.frame.origin.x, y: activeTextField.frame.origin.y , width: activeTextField.frame.size.width, height: activeTextField.frame.size.height + keyboardExtraPadding)
                dispatch_async(dispatch_get_main_queue(), {
                    self.scrollView.scrollRectToVisible(rectToScroll, animated: true)
                    
                })
                
            }
        }
        
    }
    
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        scrollView.contentInset = UIEdgeInsetsZero
        scrollView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
}


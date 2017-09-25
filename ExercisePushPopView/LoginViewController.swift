//
//  LoginViewController.swift
//  ExercisePushPopView
//
//  Created by Van Ho Si on 9/25/17.
//  Copyright © 2017 Van Ho Si. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var users = ["hosivan": "1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showUsersList()
    }
    
    @IBAction func actionPop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textFieldUsername: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var labelTotalUsers: UILabel!
    
    @IBOutlet weak var labelUsersList: UILabel!
    
    
    
    @IBOutlet weak var labelMessage: UILabel!
    
    func checkExistsUsername(username: String) -> Bool {
        return users[username] != nil
    }
    
    func validateForm(username: String, password: String) -> Bool{
        if(username.isEmpty || password.isEmpty){
            return false
        }
        return true
    }
    
    func showUsersList() {
        var text = ""
        var index: Int = 0
        for (username, password) in users{
            index = index + 1
            let tempText = "\(index). Username: \(username); password: \(password) "
            text += tempText
            
            print(tempText)
        }
        labelUsersList.text = text
    }
    
    @IBAction func actionButtonLogin(_ sender: UIButton) {
        let username = textFieldUsername.text!
        let password = textFieldPassword.text!
        
        let valid = self.validateForm(username: username, password: password)
        if(!valid){
            labelMessage.text = "Vui long nhap day du thong tin"
        }else{
            let existUsername = self.checkExistsUsername(username: username)
            if(existUsername){
                if(users[username] == password){
                    labelMessage.text = "Dang nhap thanh cong"
                    
                    let mathView = self.storyboard?.instantiateViewController(withIdentifier: "mathView") as! MathViewController
                    self.navigationController?.pushViewController(mathView, animated: true)
                    
                    
                }else{
                    labelMessage.text = "Mat khau khong chinh xac"
                }
            }else{
                labelMessage.text = "Username: \(username) khong ton tai"
            }
        }
    }
    
    @IBAction func actionButtonEdit(_ sender: UIButton) {
        
        
        let username = textFieldUsername.text!
        let password = textFieldPassword.text!
        
        let valid = self.validateForm(username: username, password: password)
        if(!valid){
            labelMessage.text = "Vui long nhap day du thong tin"
        }else{
            let existUsername = self.checkExistsUsername(username: username)
            if(existUsername){
                users[username] = password
                labelMessage.text = "Username: \(username). Cap nhat thong tin thanh cong"
                self.showUsersList()
            }else{
                labelMessage.text = "Khong tim thay Username: \(username) de sua"
            }
        }
    }
    
    @IBAction func actionButtonDelete(_ sender: UIButton) {
        
        
        let username = textFieldUsername.text!
        let existUsername = self.checkExistsUsername(username: username)
        if(existUsername){
            users.removeValue(forKey: username)
            labelMessage.text = "Username: \(username), da xoa thanh cong"
            self.showUsersList()
        }else{
            labelMessage.text = "Khong tim thay Username: \(username) de xoa"
        }
    }
    
    
    @IBAction func actionButtonAdd(_ sender: UIButton) {
        
        
        let username = textFieldUsername.text!
        let password = textFieldPassword.text!
        
        let valid = self.validateForm(username: username, password: password)
        if(!valid){
            labelMessage.text = "Vui long nhap day du thong tin"
        }else{
            let existUsername = self.checkExistsUsername(username: username)
            if(existUsername){
                labelMessage.text = "Username: \(username) da ton tai"
            }else{
                users[username] = password
                labelMessage.text = "Them thanh cong"
                self.showUsersList()
            }
        }
        
        
    }
    
    
    @IBAction func actionButtonList(_ sender: UIButton) {
        
        self.showUsersList()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

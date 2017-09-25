//
//  ViewController.swift
//  ExercisePushPopView
//
//  Created by Van Ho Si on 9/25/17.
//  Copyright © 2017 Van Ho Si. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func actionLogin(_ sender: UIButton) {
            print("actionLogin")
        
        let loginView = self.storyboard?.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
        
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    
    @IBOutlet weak var labelButtonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logo.alpha = 0
        logoText.alpha = 0
        labelButtonLogin.alpha = 0
        
        //        print("viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        print("viewWillAppear")
        
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.logo.alpha = 1
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.logoText.center = CGPoint(x: self.logo.center.x, y: 110)
                self.logoText.alpha = 1
            }) { (finished) in
                UIView.animate(withDuration: 1, animations: {
                    self.labelButtonLogin.alpha = 1
                    self.labelButtonLogin.center = CGPoint(x: self.logo.center.x, y: 600)
                })
            }
            
        }
    }
    
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var logoText: UILabel!
    
    


}


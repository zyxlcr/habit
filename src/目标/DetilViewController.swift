//
//  DetilViewController.swift
//  目标
//
//  Created by arick on 2022/11/30.
//

import UIKit

class DetilViewController:UIViewController{
    
    var habit:Habit? = nil
    
    @IBAction func save(_ sender: Any) {
        Db.saveDone(id: habit!.id as Int64)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
}

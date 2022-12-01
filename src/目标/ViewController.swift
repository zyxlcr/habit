//
//  ViewController.swift
//  目标
//
//  Created by arick on 2022/11/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hetitle: UITextField!
    
    @IBOutlet weak var yiyi: UITextField!
    
    @IBOutlet weak var spe: UITextField!
    
    @IBOutlet weak var hengliang: UITextField!
    
    @IBOutlet weak var shixian: UITextField!
    
    @IBOutlet weak var resultField: UITextField!
    
    @IBOutlet weak var timely: UITextField!
    
    
    @IBOutlet weak var doTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.toAdd))
    }
    
    @IBAction func save(_ sender: Any) {
        let id = Db.insert(s: initHabit())
        print("ok: \(id)")
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    func initHabit() -> Habit{
        let h = Habit()
        h.title = hetitle.text ?? ""
        h.yiyi = yiyi.text ?? ""
        h.actionable = shixian.text ?? ""
        h.measurable = hengliang.text ?? ""
        h.specific = spe.text ?? ""
        h.result = resultField.text ?? ""
        h.timely = timely.text ?? ""
        h.dotime = doTime.text ?? ""
        return h
    }
    
    
    @IBAction func toAdd()  {
        print("123")
    }
    
    @IBAction func doSomething(sender: UIButton){
        
    }
    @IBAction func doSomething2(sender: UIButton, forEvent event: UIEvent){
        
    }



}


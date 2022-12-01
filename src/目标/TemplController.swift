//
//  TemplController.swift
//  目标
//
//  Created by arick on 2022/11/30.
//

import UIKit

class TemplController :UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aimCell") as! AimCell
        cell.title.text = "晨练"
        return cell as UITableViewCell
    }
    
    
    @IBOutlet weak var tab: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.dataSource = self
        tab.delegate = self
    }
    
    
    
    
}

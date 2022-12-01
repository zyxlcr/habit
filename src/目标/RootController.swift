//
//  RootController.swift
//  目标
//
//  Created by arick on 2022/11/12.
//

import UIKit
import SnapKit

class RootController: UIViewController {
    
    var heb = Array<Habit>()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Db.initHabit()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        addButton()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heb = Db.GetAll()
        print(heb)
        self.tableView.reloadData()
    }
    
    func addButton(){
        let b = UIButton(type: .custom)
        b.setTitle("+OK", for: .normal)
        b.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(b)
        b.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(self.view).offset(-40)
            make.right.equalTo(self.view).offset(-40)
        }
        b.addTarget(self, action: #selector(self.toDoing), for: .touchDown)
    }
    
    @IBAction func toDoing(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PlanViewController") as! PlanViewController
       
        
        self.navigationController?.show(vc, sender: nil)
        
        
    }


}

extension RootController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heb.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndexCell", for: indexPath) as! IndexCell
        cell.title.text = heb[indexPath.row].title
        if heb[indexPath.row].result != "1" {
            cell.ststus.text = "未完成"
        }else{
            cell.ststus.text = "已完成"
        }
        print(indexPath.hashValue)
        return cell as UITableViewCell
    }
}


extension RootController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetilViewController") as! DetilViewController
        let h = heb[indexPath.row]
        vc.habit = h
        
        self.navigationController?.show(vc, sender: h)
    }
}

//
//  firstVC.swift
//  blockTestDemo
//
//  Created by qj.huang on 2018/8/27.
//  Copyright © 2018年 qj.huang. All rights reserved.
//

import UIKit

class firstVC: UIViewController {
    //MARK: - properties
    var tableView: UITableView!
}

//MARK: - system
extension firstVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initPageView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//MARK: - data netWorkData
extension firstVC {
    
}

//MARK: - ui
extension firstVC {
    
    // page view
    func initPageView() {
        self.title = "firstVC"
        
        initTableView()
    }
    
    func initTableView() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(firstTableViewCell.self, forCellReuseIdentifier: "firstTableViewCellIndentify")
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
    
}

//MARK: - delegate
extension firstVC: UITableViewDelegate, UITableViewDataSource, FirstCellDelegate {
    
    func firstCellBtnTap(_ cell: firstTableViewCell) {
        let cellIndexPath = self.tableView.indexPath(for: cell)
        print("delegate回调 section:\(cellIndexPath?.section ?? 0), row:\(cellIndexPath?.row ?? 0)")
    }
    
    // UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCellIndentify", for: indexPath) as! firstTableViewCell
      
        cell.setCell(txt: "Lbl: \(indexPath.section)")
        
        cell.delegate = self
        
        cell.firstCellBlock = {(cell : firstTableViewCell) in
            
            let cellIndexPath = tableView.indexPath(for: cell)
            print("block回调 section:\(cellIndexPath?.section ?? 0), row:\(cellIndexPath?.row ?? 0)")
            
        }

        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击第\(indexPath.section)行")
    }
}

//MARK: - logic
extension firstVC {
    
}

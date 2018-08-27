//
//  firstTableViewCell.swift
//  blockTestDemo
//
//  Created by qj.huang on 2018/8/27.
//  Copyright © 2018年 qj.huang. All rights reserved.
//

import UIKit


typealias FirstCellBlock = (_ cell:firstTableViewCell) -> ()

protocol FirstCellDelegate:class {
    func firstCellBtnTap(_ cell: firstTableViewCell)  //点击
}


class firstTableViewCell: UITableViewCell {
    
    
    var firstCellBlock:FirstCellBlock?
    
    
    weak var delegate: FirstCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //tableViewCell Code Snippet
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    var txtLbl:UILabel!
//    var imgVi:UIImageView!
    var btn: UIButton!
    var lineVi:UIView!
    
    func setUpUI() {
        txtLbl = UILabel.init(frame: CGRect.init(x: 12, y: (self.frame.size.height - 21) / 2.0, width: 200, height: 21))
        self.addSubview(txtLbl)
        
        let btn = UIButton()
        let txtLblRight = txtLbl.frame.origin.x + txtLbl.frame.size.width
        btn.frame = CGRect.init(x: txtLblRight + 5 , y: 0, width: 200, height: 21)
        btn.center.y = txtLbl.center.y
        btn.setTitle("点击", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(self.btnTap(_:)), for: .touchUpInside)
        self.addSubview(btn)
        
//        imgVi = UIImageView.init(frame: CGRect.init(x: self.frame.size.width - 12 - 14, y: (self.frame.size.height - 14) / 2.0, width: 14, height: 14))
//        imgVi.backgroundColor = UIColor.red
//        self.addSubview(imgVi)
        
        lineVi = UIView.init(frame: CGRect.init(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5))
        lineVi.backgroundColor = UIColor.lightGray
        self.addSubview(lineVi)
    }
    
    // btnTap
    @objc func btnTap(_ sender: UIButton) {
        if let firstCellBlock = self.firstCellBlock {
            _ = firstCellBlock(self)
        }
        
        if let delegate = self.delegate {
            delegate.firstCellBtnTap(self)
        }

    }
    
    func setCell(txt:String) {
        txtLbl.text = txt
    }
    
}

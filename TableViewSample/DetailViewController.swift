//
//  DetailViewController.swift
//  TableViewSample
//
//  Created by Masuhara on 2017/06/10.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // タレントの情報を入れておくDictionary変数
    var talent: Dictionary<String, Any?>!
    
    // 名前のラベル
    @IBOutlet var nameLabel: UILabel!
    
    // 誕生日のラベル
    @IBOutlet var birthdayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nameキーで取り出した値をString型にダウンキャストして名前を表示
        nameLabel.text = talent["name"] as? String
        
        // birthdayキーで取り出した値をString型にダウンキャストして誕生日を表示
        birthdayLabel.text = talent["birthday"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  ViewController.swift
//  TableViewSample
//
//  Created by Masuhara on 2017/06/10.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // データの配列
    let talents = [["name": "青山テルマ","birthday": "1987年10月27日"],
                 ["name": "市川海老蔵", "birthday": "1977年12月6日"],
                 ["name": "ウド鈴木", "birthday": "1970年1月19日"],
                 ["name": "エド・はるみ", "birthday": "1964年5月14日"],
                 ["name": "大久保佳代子", "birthday": "1971年5月12日"]]
    
    // Storyboard上のTableView
    @IBOutlet var talentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableViewDataSourceの処理をこのViewControllerで書きますよ、ということを指定
        talentTableView.dataSource = self
        
        // TableViewDelegateの処理をこのViewControllerで書きますよ、ということを指定
        talentTableView.delegate = self
        
        // 要らない罫線を消す
        talentTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 表示させるセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // names配列の数だけセルを作る
        return talents.count
    }
    
    // 表示させるセルの中身を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // まずはStoryboardでidを指定した再利用可能なセルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell")!
        
        // セルにnames配列の中身を表示
        cell.textLabel?.text = talents[indexPath.row]["name"]
        
        return cell
    }
    
    
    // TableViewのCellが押されたとき(押される動作の直後)に呼ばれるDelegateメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択状態を解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 画面遷移時に呼ばれるViewControllerが標準で持っている機能
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面を取得して、DetailViewControllerに変換
        let detailViewController = segue.destination as! DetailViewController
        
        // 選択されているセルのindexPathを取得
        let selectedIndexPath = talentTableView.indexPathForSelectedRow
        
        // タレント配列の選択されたセル番目の情報を取得してselectedTalent変数に代入
        let selectedTalent = talents[selectedIndexPath!.row]
        
        // DetailViewControllerのtalent変数に今選ばれているタレントを代入
        detailViewController.talent = selectedTalent
    }
}


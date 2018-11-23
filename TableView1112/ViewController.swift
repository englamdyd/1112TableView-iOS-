//
//  ViewController.swift
//  TableView1112
//
//  Created by 503-16 on 2018. 11. 12..
//  Copyright © 2018년 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //데이터 배열 생성
    var ar : [Dictionary<String, String>] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic1 = ["name":"태연", "skill":"네일", "imageName":"image1.png"]
        let dic2 = ["name":"제시카", "skill":"영어", "imageName":"image2.png"]
        let dic3 = ["name":"서연", "skill":"애교", "imageName":"image3.png"]
        let dic4 = ["name":"윤아", "skill":"춤", "imageName":"image4.png"]
        let dic5 = ["name":"티파니", "skill":"영어", "imageName":"image5.png"]
        
        ar.append(dic1)
        ar.append(dic2)
        ar.append(dic3)
        ar.append(dic4)
        ar.append(dic5)
        
        //테이블 뷰의 delegate 와 datasourcr를 설정
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

//ViewController의 기능 확장을 위한 extension 생성
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    //행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ar.count
    }
    //셀을 만들어주는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell
        
        //데이터 찾아오기
        var dic = ar[indexPath.row]
        //찾아온 데이터를 출력
        cell!.lblName.text = dic["name"]
        cell!.lblSkill.text = dic["skill"]
        cell!.imageView1.image = UIImage(named:dic["imageName"]!)
        
        return cell!
    }
    //셀의 높이를 설정하는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
}

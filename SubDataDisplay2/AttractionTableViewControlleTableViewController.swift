import UIKit

class AttractionTableViewController_AttractionTableViewController: UITableViewController {
    
    //이미지 파일 이름을 저장할 배열
    var attractionImages  = [String]()
    //레이블에 출력할 텍스트 배열
    var attractionNames  = [String]()
    //하위 뷰 컨트롤러에 넘겨줄 URL 배열
    var attractionURLs  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "가보고 싶은 곳"
        attractionNames = ["버킹검 궁전", "에펠탑", "그랜드캐년", "윈저궁", "엠파이어 스테이트 빌딩"]
        attractionURLs = [
            "http://en.wikipedia.org/wiki/Buckingham_Palace",
            "http://en.wikipedia.org/wiki/Eiffel_Tower",
            "http://en.wikipedia.org/wiki/Grand_Canyon",
            "http://en.wikipedia.org/wiki/Windsor_Castle",
            "http://en.wikipedia.org/wiki/Empire_State_Building"]
        attractionImages = ["buckingham_palace.jpg",
                            "eiffel_tower.jpg",
                            "grand_canyon.jpg",
                            "windsor_castle.jpg",
                            "empire_state_building"]
        //테이블 뷰의 셀 높이 설정
        tableView.estimatedRowHeight = 70
  
    }
    
    // MARK: - Table view data source
    
    //섹션(그룹)의 개수를 설정하는 메소드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //섹션별 행의 개수를 설정해주는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionImages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀을 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AttractionTableViewCell
        
        //행번호에 해당하는 문자열 출력
        cell.attractionLabel.text =
            attractionNames[indexPath.row]
        //이미지 출력
        cell.attractionImage.image =
            UIImage(named: attractionImages[indexPath.row])
        
        return cell
    }
    
    
    //테이블 뷰 에서 셀을 선택했을 때 호출되는 메소드
    /*
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
     
     //뷰 컨트롤러 객체 생성하기
     let detailViewController =
     self.storyboard?.instantiateViewController(
     withIdentifier: "DetailViewController")
     as! DetailViewController
     //타이틀 설정
     detailViewController.title = "하위 뷰 컨트롤러"
     //화면 전환
     self.navigationController?.pushViewController(
     detailViewController, animated: true)
     }
     */
    
    //세그웨이를 이용해서 화면 전환을 할 때 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //화면전환이 이루어질 뷰 컨트롤러 가져오기
        let detailViewController = segue.destination as! DetailViewController
        //선택한 행번호에 해당하는 인덱스 찾아오기
        let indexPath = tableView.indexPathForSelectedRow
        detailViewController.title = self.attractionNames[indexPath!.row]
        //행번호에 해당하는 데이터 넘겨주기
        detailViewController.address =
            self.attractionURLs[indexPath!.row]
        print(indexPath!)
    }

}

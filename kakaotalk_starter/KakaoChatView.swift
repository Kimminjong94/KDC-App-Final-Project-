
import UIKit

class KakaoChatLandingViewController: UIViewController {
    // TODO: TableView를 만들어서 outlet으로 추가해주세요.
    let tableViewCell: KakaoChatTableViewCell = KakaoChatTableViewCell()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //github
        setupTableView()
    }

    func setupTableView() {
        // TODO: TableView를 datasource을 설정해주세요.
    }

    private let list = Message.dummyList
}

extension KakaoChatLandingViewController: UITableViewDataSource {
    // TODO: UITableViewDataSource를 설정해주세요.
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //[x]TODO: list의 갯수만큼 나오게 해주세요.
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: KakaoChatTableViewCell을 생성해주세요. 생성하고 configure을 불러주세요.
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? KakaoChatTableViewCell {
//            let Image = listcell
//            cell.configure(message: []
//            let img = UIImage(named: "\(list[indexPath.row].senderImageName)"
//            cell.imgView?.image = "\(list[indexPath.row].senderImageName)"
            cell.nameLabel?.text = "\(list[indexPath.row].senderName)"
            cell.txtLabel?.text = "\(list[indexPath.row].lastMessage)"
            cell.dateLabel?.text = "\(list[indexPath.row].lastSentDate)"


            return cell
        } else {
            return UITableViewCell()
        }
        
    }
}

class KakaoChatTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var txtLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?

    
    func configure(message: Message?) {
        
        guard let chat = message else { return }
        imgView?.image = chat.senderImage
        nameLabel?.text = chat.senderName
        txtLabel?.text = chat.lastMessage
        dateLabel?.text = chat.lastSentDate
        
        
    }

}

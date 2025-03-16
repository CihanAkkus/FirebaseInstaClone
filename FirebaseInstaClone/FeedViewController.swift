import UIKit






class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView = UITableView()
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    
        
        
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        //cell.useremailLabel.text = "test@test.com"
        cell.likeLabel.text = "naber"
        //cell.commentLabel.text = "comment"
        //cell.userImageView.image = UIImage(named: "selectimage")
        
        return cell
    }
    

    

}

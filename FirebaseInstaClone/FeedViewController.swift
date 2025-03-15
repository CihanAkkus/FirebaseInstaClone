import UIKit






class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView = UITableView()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        /*
        cell.userEmailLabel.text = "test@test.com"
        cell.likeLabel.text = "10"
        cell.commentLabel.text = "comment"
        cell.userImageView.image = UIImage(named: "selectimage")
         */
        return cell
    }
    
    
    
    
    
    
    

}

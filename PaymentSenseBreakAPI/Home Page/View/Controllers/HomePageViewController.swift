//
//  ViewController.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 19/07/2021.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var activityIndicator: LoadingView!
    let homePageVM = HomePageViewModel()
    var didSelectItem : (Any?)->() = {_ in}
    var listItems = [Any]()
    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUserInterface()
    }
    
    //MARK: Initial page
    func loadUserInterface(){
        let myNib = UINib(nibName: "MasterTableViewCell", bundle: nil)
        tableView.register(myNib, forCellReuseIdentifier: "itemsCell")
        
        activityIndicator = LoadingView(frame: self.view.frame)
        self.view.addSubview(activityIndicator)
        activityIndicator.start()
        
        //MARK: Step 1 API call to get items
        homePageVM.makeAPICalls(completion: { result in
            self.listItems = result
            DispatchQueue.main.async {
                self.activityIndicator.stop()
                self.tableView.reloadData()
            }
        })
        //MARK: When a cell is selected
        didSelectItem = { data in
            self.shouldLoadVC(data: data, vcName: "detailsVC", sbName: "Main")
        }
    }
    
    //MARK: Load ViewController 2
    func shouldLoadVC(data: Any, vcName:String, sbName:String){
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: vcName) as? DetailsPageViewController
        {
            vc.detailItem = data
            self.present(vc, animated: true, completion: nil)
        }
    }

}


extension HomePageViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell") as! MasterTableViewCell
        let item = listItems[indexPath.row] as? [Any] ?? [Any]()
        cell.titleStr.text = ""
        if let episode = item as? [EpisodesModel]
        {
            cell.titleStr.text = "Episode"
        }
        else if let quotes = item as? [QuotesModel]{
            cell.titleStr.text = "Quotes"
        }
        else if let character = item as? [CharacterModel]{
            cell.titleStr.text = "Characters"
        }

        cell.detailedView.arr = item
        cell.detailedView.collectionView.reloadData()
        cell.detailedView.didSelectItem = { curIndex in
            self.didSelectItem(cell.detailedView.arr[curIndex])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let curItem = listItems[indexPath.row] as? [CharacterModel]{
            return 400
        }
        return 200
    }
    
    
    
}


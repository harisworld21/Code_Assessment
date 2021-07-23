//
//  DetailPageVC.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 23/07/2021.
//

import UIKit

class DetailsPageViewController: UIViewController{
    //TODO Can be done better as array
    @IBOutlet weak var img: UIImageView?
    @IBOutlet var tableView: UITableView!
    var activityIndicator: LoadingView!
    
    var detailItem: Any?
    let detailVM = DetailViewModel()
    var displayItems : [String]?
    
    override func viewDidLoad() {
        self.setupUIItems()
    }
    
    func setupUIItems(){

        activityIndicator = LoadingView(frame: self.view.frame)
        self.view.addSubview(activityIndicator)
        self.activityIndicator.start()
        if detailItem != nil{
            self.displayItems = detailVM.parseData(data: detailItem)
            self.tableView.reloadData()
            detailVM.fetchImage(data: detailItem, completion: { imge in
                DispatchQueue.main.async {
                    self.activityIndicator.stop()
                    if imge != nil {
                        self.img?.image = imge
                    }
                    else{
                        self.img?.isHidden = true
                    }
                }
            })
        }
        
    }
    
}

extension DetailsPageViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as? DetailTableCell
        {
            cell.detailTitle?.text = displayItems?[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    

}

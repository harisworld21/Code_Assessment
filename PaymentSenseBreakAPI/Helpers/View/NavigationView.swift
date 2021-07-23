//
//  NavigationView.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 19/07/2021.
//

import UIKit


class NavigationView : UIView {
    
    @IBOutlet weak var customView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: Navigation view with Label
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("NavigationView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
}

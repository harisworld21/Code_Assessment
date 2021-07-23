//
//  LoadingView.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 20/07/2021.
//

import UIKit
import AMDots

class LoadingView : UIView {
    
    @IBOutlet weak var customView:UIView!
    @IBOutlet weak var spinner: AMDots!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: Spinner class to show activity indicator
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        self.isHidden = true
    }
    
    //MARK: Start spinner
    func start()
    {
        spinner.animationType = .jump
        self.isHidden = false
    }
    
    //MARK: Stop spinner
    func stop()
    {
        self.isHidden = true
    }
}

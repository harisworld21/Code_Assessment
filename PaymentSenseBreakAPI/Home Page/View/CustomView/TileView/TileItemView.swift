//
//  LoadingView.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 20/07/2021.
//

import UIKit

class TileItemView : UIView {
    
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var idx : UILabel!
    @IBOutlet weak var occupation : UILabel!
    @IBOutlet weak var status : UILabel!
    @IBOutlet weak var characterImg : UIImageView!
    @IBOutlet weak var seasonsAppeared : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func hideIfEmpty(){
        name.isHidden = name.text?.isEmpty ?? true
        idx.isHidden = idx.text?.isEmpty ?? true
        occupation.isHidden = occupation.text?.isEmpty ?? true
        status.isHidden = status.text?.isEmpty ?? true
        seasonsAppeared.isHidden = seasonsAppeared.text?.isEmpty ?? true
    }
    
    func updateImage(str: String){
        guard let url = URL(string: str) else{
            return
        }
        downloadImage(from: url, completion: { image in
            DispatchQueue.main.async {
                self.characterImg.image = image
                self.characterImg.isHidden = false
            }
        })
    }
    
    
}

//
//  LoadingView.swift
//  PaymentSenseBreakAPI
//
//  Created by HariRamya on 20/07/2021.
//

import UIKit


class HomePageItemCollectionView : UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var didSelectItem :(Int)->() = { _ in}
    
    @IBOutlet weak var customView:UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var arr = [Any]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func loadItems(){
        let myNib = UINib(nibName: "HomePageCollectionCell", bundle: nil)
        collectionView.register(myNib, forCellWithReuseIdentifier: "collectionCell")

    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("HomePageItemCollectionView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        loadItems()
    }

}

extension HomePageItemCollectionView{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? HomePageCollectionCell else {
            return UICollectionViewCell()
        }
        self.fillCollectionView(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let curIndex = indexPath.row
        didSelectItem(curIndex)
    }
    
    //TODO: Can remove model based approach inside VIewMOdel
    func fillCollectionView(cell: HomePageCollectionCell, indexPath: IndexPath){
        if let episode = arr[indexPath.row] as? EpisodesModel, let title = episode.title, let season = episode.season
        {
            cell.tileView?.name.text = "Title : " + title
            cell.tileView?.idx.text = "Season : " + season
            cell.tileView?.hideIfEmpty()
        }
        else if let character = arr[indexPath.row] as? CharacterModel, let name = character.name, let idx = character.charID, let occupation = character.occupation, let seasons = character.appearance, let img = character.img {
            cell.tileView?.name.text = name
            cell.tileView?.occupation.text = occupation.first
            cell.tileView?.updateImage(str: img)
            let seasonsStr = seasons.map { String($0)}.joined(separator: ",")
            cell.tileView?.seasonsAppeared.text = "Seasons Appeared" + seasonsStr
            cell.tileView?.hideIfEmpty()
        }
        else if let quotes = arr[indexPath.row] as? QuotesModel, let name = quotes.quoteID, let quote = quotes.quote, let author = quotes.author, let series = quotes.series{
            cell.tileView?.name.text = "\(name)"
            cell.tileView?.idx.text  = "Quotes " + quote
            cell.tileView?.hideIfEmpty()
        }
    }

       
}

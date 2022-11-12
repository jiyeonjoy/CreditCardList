//
//  CardListViewController.swift
//  CreditCardList
//
//  Created by Jiyeon Choi on 2022/11/12.
//

import UIKit
import Kingfisher

class CardListViewController: UITableViewController {
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView
        let nibName = UINib(nibName: "CardListCellTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCellTableViewCell")
    }
}

extension CardListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCellTableViewCell", for: indexPath) as? CardListCellTableViewCell else { return UITableViewCell() }
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = creditCardList[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
    }
}

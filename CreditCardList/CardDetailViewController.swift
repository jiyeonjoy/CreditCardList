//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by Jiyeon Choi on 2022/11/12.
//

import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    var promotionDetail: PromotionDetail?
    
    @IBOutlet weak var moneyLottie: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "moneyAnim")
        self.moneyLottie.contentMode = .scaleAspectFit
        self.moneyLottie.addSubview(animationView)
        animationView.frame = self.moneyLottie.bounds
        animationView.loopMode = .loop
        animationView.play()
        
        guard let detail = promotionDetail else { return }
        self.titleLabel.text = """
            \(detail.companyName)카드 쓰면
            \(detail.amount)만원 드려요
            """
        self.periodLabel.text = detail.period
        self.conditionLabel.text = detail.condition
        self.benefitConditionLabel.text = detail.benefitCondition
        self.benefitDetailLabel.text = detail.benefitDetail
        self.benefitDateLabel.text = detail.benefitDate
    }
}

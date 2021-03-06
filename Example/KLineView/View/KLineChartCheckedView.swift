//
//  KLineChartCheckedView.swift
//  KLineView_Example
//
//  Created by 程守斌 on 2019/3/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import KLineView

class KLineChartCheckedView: BaseView {
    
    private lazy var bubbleView:UIView = {
        let bubbleView = UIView()
        bubbleView.backgroundColor = UIColor(hexString: "#1F232D")
        return bubbleView
    }()
    
    lazy var kPeriodButtons:[UIButton] = {
        var kPeriodButtons = [UIButton]()
        for title in KLinePeriod.getAllPeriods() {
            let button = UIButton()
            button.setTitleColor(UIColor(hexString: "#8E9AB5"), for: .normal)
            button.setTitleColor(UIColor(hexString: "#567AF2"), for: .selected)
            button.setTitleColor(UIColor(hexString: "#567AF2"), for: [.selected,.highlighted])
            button.setBackgroundImage(UIImage.creatWithColor(UIColor(hexString: "#1F232D")), for: .highlighted)
            button.setBackgroundImage(UIImage.creatWithColor(UIColor(hexString: "#1F232D")), for: [.selected,.highlighted])
            button.setBackgroundImage(UIImage.creatWithColor(UIColor(hexString: "#181C26")), for: .selected)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            kPeriodButtons.append(button)
        }
        return kPeriodButtons
    }()
    
    private lazy var buttonBoxViews:[UIView] = {
        var buttonBoxViews = [UIView]()
        for button in kPeriodButtons {
            let boxView = UIView()
            boxView.addSubview(button)
            button.snp.makeConstraints { (make) in
                make.width.equalTo(55)
                make.top.bottom.equalToSuperview()
                make.center.equalToSuperview()
            }
            buttonBoxViews.append(boxView)
        }
        return buttonBoxViews
    }()
    
    override func makeUI() {
        self.addSubviews([bubbleView])
        
        bubbleView.addSubviews(buttonBoxViews)
    }
    
    override func makeConstraint() {
        bubbleView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(207)
        }
        
        for (index, view) in buttonBoxViews.enumerated() {
            
            view.snp.makeConstraints { (make) in
                make.height.equalTo(25)
                make.width.equalTo(bubbleView.snp.width).multipliedBy(1.0/5.0)
                make.left.equalTo(index % 5 == 0 ? bubbleView : buttonBoxViews[index-1].snp.right)
                make.top.equalTo(index < 5 ? bubbleView : buttonBoxViews[index-5].snp.bottom).offset(15)
                if index == buttonBoxViews.count-1 {
                    make.bottom.equalTo(-15)
                }
            }
        }
        
    }
    
    override func makeEvent() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureAction(_:)))
        self.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: nil)
        bubbleView.addGestureRecognizer(tap1)
    }
    
    @objc private func handleTapGestureAction(_ recognizer: UILongPressGestureRecognizer){
        self.isHidden = true
    }
    
    func refreshUI(frame:CGRect ,kPeriod:KLinePeriod) {
        bubbleView.snp.remakeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(frame.maxY)
        }
        
        for button in kPeriodButtons {
            button.isSelected = false
        }
        
        let index = KLinePeriod.indexFor(kPeriod: kPeriod)
        kPeriodButtons[index].isSelected = true
    }
}

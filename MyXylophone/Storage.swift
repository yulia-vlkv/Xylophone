//
//  Storage.swift
//  MyXylophone
//
//  Created by Iuliia Volkova on 29.09.2021.
//

import UIKit
import AVFoundation

var colors = [UIColor(named: "KindaPink"),
              UIColor(named: "KindaCherokee"),
              UIColor(named: "KindaRose"),
              UIColor(named: "KindaSandy"),
              UIColor(named: "KindaTurquoise"),
              UIColor(named: "KindaMint"),
              UIColor(named: "KindaTeal")]

var letters = ["C", "D", "E", "F", "G", "A", "B"]

var insets: Array<CGFloat> = [70, 80, 90, 100, 110, 120, 130]



//class customButton: UIButton {
//    var index: Int
//    var color: UIColor
//    var inset: CGFloat
//    var letter: String
//    
//    init(index: Int, color: UIColor, inset: CGFloat, letter: String) {
//        self.index = index
//        self.color = color
//        self.inset = inset
//        self.letter = letter
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

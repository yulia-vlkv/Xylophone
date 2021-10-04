//
//  ViewController.swift
//  MyXylophone
//
//  Created by Iuliia Volkova on 29.09.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.toAutoLayout()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        stackView.spacing = 15
        stackView.toAutoLayout()
        return stackView
    }()

    private func addPanel(buttonIndex: Int) {
        let button = UIButton()
        let currentInset = CGFloat(view.frame.width - insets[buttonIndex])
        let constraint = button.widthAnchor.constraint(equalToConstant: currentInset)
        constraint.isActive = true
        button.backgroundColor = colors[buttonIndex]
        button.setTitle(letters[buttonIndex], for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(button)
    }
    
     @objc func customButtonTapped(_ button: UIButton) {
         let sound = button.titleLabel!.text
         playSound(sound: sound!)
     }
    
    func playSound(sound: String) {
        let path = Bundle.main.path(forResource: "\(sound).wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Couldn't load the file")
        }
    }
    
    private var inset: CGFloat {return 20}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        
        view.addSubview(contentView)
        
        contentView.addSubview(stackView)

        for i in 0...6 {
            addPanel(buttonIndex: i)
        }
        
        let constraints = [
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: inset),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,  constant: -inset)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}


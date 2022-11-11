//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    // 버튼 스택뷰
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 왼쪽 고객추가 버튼
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 초기화 버튼
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 업무시간
    lazy var workTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "업무시간 - \(String("04:33:253"))"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 라벨 스택
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 대기중 라벨
    lazy var waitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .systemGreen
        label.text = "대기중"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 업무중 라벨
    lazy var workLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.backgroundColor = .systemIndigo
        label.text = "업무중"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 스크롤뷰를 담는 스택뷰
    lazy var scrollStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 왼쪽 스크롤 뷰 - 대기중
    lazy var leftScrollView: UIScrollView = {
        let scrollView =  UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 오른쪽 스크롤 뷰 - 업무중
    lazy var rightScrollView: UIScrollView = {
        let scrollView =  UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 왼쪽 스크롤뷰 내부 스택뷰
    lazy var leftContentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 오른쪽 스크롤뷰 내부 스택뷰
    lazy var rightContentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // 버튼 스택뷰
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // 업무시간 오토레이아웃
        view.addSubview(workTimeLabel)
        NSLayoutConstraint.activate([
            workTimeLabel.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor),
            workTimeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            workTimeLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            workTimeLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        // 라벨 스택뷰
        labelStackView.addArrangedSubview(waitLabel)
        labelStackView.addArrangedSubview(workLabel)
        view.addSubview(labelStackView)
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.workTimeLabel.bottomAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        // 스크롤 스택 뷰
        setupScrollView()
    }
    
    func setupScrollView() {
        scrollStackView.addArrangedSubview(leftScrollView)
        scrollStackView.addArrangedSubview(rightScrollView)
        view.addSubview(scrollStackView)
        
        leftScrollView.addSubview(leftContentView)
        rightScrollView.addSubview(rightContentView)
        
        // 스택뷰 제약조건
        NSLayoutConstraint.activate([
            scrollStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor),
            scrollStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        // 컨텐츠 제약조건
        NSLayoutConstraint.activate([
            leftContentView.topAnchor.constraint(equalTo: leftScrollView.topAnchor),
            leftContentView.leadingAnchor.constraint(equalTo: leftScrollView.leadingAnchor),
            leftContentView.trailingAnchor.constraint(equalTo: leftScrollView.trailingAnchor),
            leftContentView.bottomAnchor.constraint(equalTo: leftScrollView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            rightContentView.topAnchor.constraint(equalTo: rightScrollView.topAnchor),
            rightContentView.leadingAnchor.constraint(equalTo: rightScrollView.leadingAnchor),
            rightContentView.trailingAnchor.constraint(equalTo: rightScrollView.trailingAnchor),
            rightContentView.bottomAnchor.constraint(equalTo: rightScrollView.bottomAnchor)
        ])
        
        leftContentView.widthAnchor.constraint(equalTo: leftScrollView.widthAnchor).isActive = true
        rightContentView.widthAnchor.constraint(equalTo: rightScrollView.widthAnchor).isActive = true
    }
}



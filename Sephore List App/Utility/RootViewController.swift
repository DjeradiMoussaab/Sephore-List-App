//
//  RootViewController.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//

import Foundation
import UIKit

public class RootViewController: UIViewController {
    
    private let navigationViewController: UINavigationController = {
        let navigationViewController = UINavigationController()
        navigationViewController.navigationBar.isHidden = true
        return navigationViewController
    }()
    
    func setup() {
        navigationViewController.setViewControllers([ProductListVC()], animated: false)
        addChild(navigationViewController)
        view.addSubview(navigationViewController.view)
        navigationViewController.didMove(toParent: self)
    }
    
    func layout() {
        navigationViewController.view.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
}

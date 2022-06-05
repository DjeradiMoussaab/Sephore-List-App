//
//  PairingViewController.swift
//  Sephore List App
//
//  Created by mossab on 6/6/2022.
//


import UIKit

/* this is subclass of UIViewcontroller, it helps attaching the passed UIView to the ViewController. Instead of doing the same work on every Scene. we just create the ViewController using this class. */

open class PairingViewController<PairedView: UIView>: UIViewController {
    public var pairedView: PairedView {
        guard let view = view as? PairedView else { fatalError("Bad view type. expecting: \(type(of: PairedView.self)), found: \(type(of: self.view.self)).") }
        return view
    }

    open override func loadView() {
        view = PairedView()
    }
}

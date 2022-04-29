//
//  SIViewController.swift
//  BuenasTardes
//
//  Created by Andreas Frisch on 28/04/2022.
//

import UIKit

#if DEBUG
func listSubviews(_ view: UIView, indent: Int) {
    for subview in view.subviews {
        print("\(String(repeating: "\t", count: indent))\(subview.description)")
        print("\(String(repeating: "\t", count: indent))\(subview.constraints)")
        print("\(String(repeating: "\t", count: indent))\(subview.traitCollection)")
        print("\(String(repeating: "\t", count: indent))\(subview.layer.debugDescription)")
        print("\n")
        listSubviews(subview, indent: indent+1)
    }
}
#endif

class SIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        #if DEBUG
        print(listSubviews(self.view, indent: 0))
        #endif
    }
}

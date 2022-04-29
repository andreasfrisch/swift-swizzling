//
//  SIViewController.swift
//  BuenasTardes
//
//  Created by Andreas Frisch on 28/04/2022.
//

import UIKit

private var hasSwizzled = false

private func listSubviews(_ view: UIView, indent: Int) {
    for subview in view.subviews {
        print("\(String(repeating: "\t", count: indent))\(subview.description)")
        print("\(String(repeating: "\t", count: indent))\(subview.constraints)")
        print("\(String(repeating: "\t", count: indent))\(subview.traitCollection)")
        print("\(String(repeating: "\t", count: indent))\(subview.layer.debugDescription)")
        print("\n")
        listSubviews(subview, indent: indent+1)
    }
}

public extension UIViewController {
    final class func doSwizzle() {
        guard !hasSwizzled else { return } // do once
    
        hasSwizzled = true
        
        let originalSelector = #selector(self.viewWillAppear(_:))
        let swizzledSelector = #selector(nsh_viewWillAppear)
        
        let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector)!
        
        let didAddMethod = class_addMethod(UIViewController.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    
    // MARK: - Method Swizzling
    @objc func nsh_viewWillAppear(animated: Bool) {
        listSubviews(self.view, indent: 0)
        return nsh_viewWillAppear(animated: animated)
    }
}

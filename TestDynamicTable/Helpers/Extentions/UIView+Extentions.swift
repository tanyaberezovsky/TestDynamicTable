//
//  UIView+Extentions.swift
//  TestDynamicTable
//
//  Created by Tanya Berezovsky on 06/08/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

extension UIView {
    func loadNib() -> UIView? {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        return loadNib(nibName: nibName)
    }
    func loadNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load view from nib file \(nibName).")
        }
        return view
    }
    
    func fillSuperview(padding: UIEdgeInsets) {
        _ = anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: padding.top))
        }
        
        if let left = leading {
            anchors.append(leadingAnchor.constraint(equalTo: left, constant: padding.left))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
        }
        
        if let right = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: right, constant: -padding.right))
        }
        
        if size.width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: size.width))
        }
        
        if size.height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: size.height))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
}


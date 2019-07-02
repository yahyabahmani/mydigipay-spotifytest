//
//  Extension.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import UIKit
import Kingfisher
extension UITableView {
    func registerCell(_ name : String) {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
extension UIView {
    class var nibName: String {
        return String(describing: self)
    }
}
extension UIImageView {
    @objc func setImageWithKingFisher(url : String?) {
        if let u = url {
            
            if let urls = URL(string : u) {
//                let resource = ImageResource(downloadURL: urls )
                self.kf.setImage(with: urls)
            }
        }
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadiuss: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidths: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColors: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadiuss: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacitys: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffsets: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColors: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

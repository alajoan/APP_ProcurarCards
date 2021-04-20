//
//  UIStoryboardExtension.swift
//  ConsumoAPI
//
//  Created by Jonathan Alajoan Rocha on 08/03/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func buildTableViewController() -> UIViewController {
        return tableViewStoryboard.instantiateViewController(withIdentifier: "CardTableView")
    }
}


extension UIStoryboard {
    static var tableViewStoryboard: UIStoryboard {
        return getStoryboard(name: "Main")
    }
}


extension UIStoryboard {
    static func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}





//
//  Storyboardable.swift
//  GithubJobs
//
//  Created by George Nyakundi on 28/04/2021.
//

import UIKit

protocol Storyboardable {
    
    // MARK: - Properties
    
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    
    // MARK: -
    
    static var storyboardIdentifier: String { get }
    
    // MARK: - Methods
    
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    // MARK: - Properties
    
    static var storyboardName: String {
        return "Main"
    }
    
    static var storyboardBundle: Bundle {
        return .main
    }
    
    // MARK: -
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: -
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(identifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller with Storyboard identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}



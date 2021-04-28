//
//  AppCoordinator.swift
//  GithubJobs
//
//  Created by George Nyakundi on 28/04/2021.
//

import UIKit
import Foundation

class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // MARK: -
    
    func start() {
        showJobs()
    }
    
    // MARK: - Helper Methods
    private func showJobs() {
        // Initialize GithubJobsLandingViewController
        let githubJobsLandingViewController = GithubJobsLandingViewController.instantiate()
        
        // Configure GithubJobDetailsViewController
        githubJobsLandingViewController.didShowGithubJobDetails = { [weak self] (githubJob) in
            self?.showJobDetails(githubJob)
        }
        
        // Push GithubJobs View Controller on Navigation Stack
        navigationController.pushViewController(githubJobsLandingViewController, animated:true)
    }
    
    private func showJobDetails( _ githubJob: GithubJob) {
        // Initialize GithubJobDetails ViewController
        let githubJobDetailsViewController = GithubJobsDetailViewController.instantiate()
        
        // Configure GithubJobDetailsViewController
        githubJobDetailsViewController.jobDetails = githubJob
        
        // Push GithubJobDetailsViewController Onto Navigation Stack
        navigationController.pushViewController(githubJobDetailsViewController, animated: true)
    }
}

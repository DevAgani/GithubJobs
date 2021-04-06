//
//  ViewController.swift
//  GithubJobs
//
//  Created by George Nyakundi on 23/03/2021.
//

import UIKit

class GithubJobsLandingViewController: UIViewController {
    var jobs = [GithubJob]()
    
    
//    MARK: - Outlets
    @IBOutlet weak var jobsSearchBar: UISearchBar!
    @IBOutlet weak var jobLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var jobsFilterButton: UIButton!
    @IBOutlet weak var jobsTableView: UITableView! 
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        if(navigationController?.topViewController != self){
            navigationController?.navigationBar.isHidden = false
        }
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        jobsTableView.dataSource = self
        jobsTableView.delegate = self
        //FetchNetworkData
        jobLoadingIndicator.startAnimating()
        jobLoadingIndicator.isHidden = false
        jobsTableView.isHidden = true
        fetchNetworkJobs()
        configureFilterButton()
    }
    
//    Methods

    
    func setupTableView() {
        jobsTableView.rowHeight = UITableView.automaticDimension
        jobsTableView.tableFooterView = UIView()
        let nib = UINib(nibName: GithubJobTableViewCell.cellIdentifier, bundle: nil)
        jobsTableView.register(nib, forCellReuseIdentifier: GithubJobTableViewCell.cellIdentifier)
    }
//    configureFilterButton
    func configureFilterButton(){
        jobsFilterButton.clipsToBounds = true
        jobsFilterButton.layer.cornerRadius = 5
    }
    func fetchNetworkJobs() {
        
        DispatchQueue.main.async {
            GithubAPIService.shared.fetchAllJobs { [weak self] result in
                guard let `self` = self else {
                    return
                }
//                self.jobLoadingIndicator.stopAnimating()
                self.jobLoadingIndicator.isHidden = true
                switch result {
                case .failure(let error):
                    print("Error occured \(error)")
                case .success(let jobs):
                    self.jobsTableView.isHidden = false
                    self.jobs = jobs
                    self.jobsTableView.reloadData()
                }
            }
        }
        
    }
    
    // TEST- Show as popover on click
    @objc func displayDetailsPage(){
        
    }
    
}

extension GithubJobsLandingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jobs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jobsTableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let jobDetailsVC = storyboard.instantiateViewController(identifier: "GithubJobsDetailViewController") as? GithubJobsDetailViewController else {
            return
        }
        jobDetailsVC.jobDetails = jobs[indexPath.row]
        navigationController?.pushViewController(jobDetailsVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = jobsTableView.dequeueReusableCell(withIdentifier: GithubJobTableViewCell.cellIdentifier, for: indexPath) as? GithubJobTableViewCell else {
            fatalError("unable to create cell")
        }
        
        cell.layer.borderColor = CGColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        cell.layer.borderWidth =  4
        
        let jobOpening = jobs[indexPath.row]
        cell.configure(usingModel: jobOpening)
        
        return cell
        
    }
    
    
}


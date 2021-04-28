//
//  GithubJobsDetailViewController.swift
//  GithubJobs
//
//  Created by George Nyakundi on 23/03/2021.
//

import UIKit

class GithubJobsDetailViewController: UIViewController, Storyboardable {
    
    var jobDetails : GithubJob?
    
//    MARK:- Outlets
    
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    
    @IBOutlet weak var workingHours: UILabel!
    @IBOutlet weak var jobType: UILabel!
    
    @IBOutlet weak var jobCompensation: UILabel!
    @IBOutlet weak var jobDescription: UITextView!
    
    @IBOutlet weak var jobTypes: UILabel!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDetails()
    }
    func populateDetails() {
        jobTitle.text = jobDetails?.title ?? "-"
        jobLocation.text = jobDetails?.company ?? "-"
        jobType.text = jobDetails?.location ?? "-"
        jobTypes.text = jobDetails?.type ?? ""
        workingHours.text = "-"
        jobCompensation.text = "-"
        jobDescription.text = jobDetails?.description?.htmlToString ?? ""
    }
    
   
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            jobDescription.text = jobDetails?.description?.htmlToString ?? ""
            
        } else if sender.selectedSegmentIndex == 1 {
            jobDescription.text = jobDetails?.how_to_apply?.htmlToString ?? ""
            
        }
    }
    
   
}

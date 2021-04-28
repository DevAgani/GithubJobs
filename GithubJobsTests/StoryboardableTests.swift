//
//  StoryboardableTests.swift
//  GithubJobsTests
//
//  Created by George Nyakundi on 23/03/2021.
//

import XCTest
@testable import GithubJobs

class StoryboardableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGithubJobLandingViewController() {
        _ = GithubJobsLandingViewController.instantiate()
    }
    
    func testGithubJobsDetailsLandingViewController() {
        _ = GithubJobsDetailViewController.instantiate()
    }
}

//
//  GithubJobModel.swift
//  GithubJobs
//
//  Created by George Nyakundi on 23/03/2021.
//

import Foundation

struct GithubJob: Codable {
    var id: String?
    var title: String?
    var type: String?
    var company: String?
    var company_logo: String?
    var company_url: String?
    var description: String?
    var location: String?
    var url: String?
    var created_at: String?
    var how_to_apply: String?
}

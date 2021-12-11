//
//  DashboardNews.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

struct DashboardNews: Codable {
    var breakingNews: String?
    let topNews: [String]?
    let dailyBriefings: String?
    let technicalAnalysis: [String]?
    let specialReport: [String]?
}

//
//  DashboardNews.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

extension DashboardNews {
    enum CodingKeys: String, CodingKey {
        case breakingNews = "breakingNews"
        case topNews = "topNews"
        case dailyBriefings = "dailyBriefings"
        case technicalAnalysis = "technicalAnalysis"
        case specialReport = "specialReport"
    }
}

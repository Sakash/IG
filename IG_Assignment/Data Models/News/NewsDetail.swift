//
//  NewsDetail.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

struct NewsDetail: Codable {
    var title: String?
    let url: String?
    let description: String?
    let content: String?
    let firstImageUrl: String?
    var headlineImageUrl: String?
    let articleImageUrl: String?
    let backgroundImageUrl: String?
    let videoType: String?
    let videoId: String?
    var videoUrl: String?
    let videoThumbnail: [String]?
    let newsKeywords: String?
    let authors: [AuthorDetail]?
    let instruments: [String]?
    let tags: [String]?
    let categories: [String]?
    let displayTimestamp: String?
    let lastUpdatedTimestamp: String?
}

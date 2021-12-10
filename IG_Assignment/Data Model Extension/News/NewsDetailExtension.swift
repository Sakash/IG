//
//  NewsDetail.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

extension NewsDetail {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case url = "url"
        case description = "description"
        case content = "content"
        case firstImageUrl = "firstImageUrl"
        case headlineImageUrl = "headlineImageUrl"
        case articleImageUrl = "articleImageUrl"
        case backgroundImageUrl = "backgroundImageUrl"
        case videoType = "videoType"
        case videoId = "videoId"
        case videoUrl = "videoUrl"
        case videoThumbnail = "videoThumbnail"
        case newsKeywords = "newsKeywords"
        case authors = "authors"
        case instruments = "instruments"
        case tags = "tags"
        case categories = "categories"
        case displayTimestamp = "displayTimestamp"
        case lastUpdatedTimestamp = "lastUpdatedTimestamp"
    }
}

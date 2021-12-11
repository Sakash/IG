//
//  AuthorExtension.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 10/12/21.
//

import Foundation

extension AuthorDetail {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case title = "title"
        case bio = "bio"
        case email = "email"
        case phone = "phone"
        case facebook = "facebook"
        case twitter = "twitter"
        case googleplus = "googleplus"
        case subscription = "subscription"
        case rss = "rss"
        case description = "descriptionLong"
        case descriptionShort = "descriptionShort"
        case photo = "photo"
    }
}

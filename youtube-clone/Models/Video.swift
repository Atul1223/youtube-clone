//
//  Video.swift
//  youtube-clone
//
//  Created by Atul Kumar on 12/01/21.
//

import Foundation

struct Video : Decodable{
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title = "title"
        case description = "description"
        case thumbnail = "url"
        case videoID = "videoId"
        
    }
    
    init (from decoder: Decoder) throws {
        
       let container = try decoder.container(keyedBy : CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse publishedAt
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnails
        let thumnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse videoID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoID)
        
        
    }
    
}

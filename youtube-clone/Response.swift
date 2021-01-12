//
//  Response.swift
//  youtube-clone
//
//  Created by Atul Kumar on 12/01/21.
//

import Foundation

struct  Response : Decodable {
    
    var items:[video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([video].self, forKey: .items)
        
    }
    
}

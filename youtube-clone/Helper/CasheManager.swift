//
//  CasheManager.swift
//  youtube-clone
//
//  Created by Atul Kumar on 19/01/21.
//

import Foundation

class CascheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCashe(_ url:String, _ data:Data?) {
        
        //store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //try to get the data for the specified urlk
        return cache[url]
        
    }
    
}

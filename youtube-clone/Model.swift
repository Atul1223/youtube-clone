//
//  Model.swift
//  youtube-clone
//
//  Created by Atul Kumar on 12/01/21.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //create url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get a url session obect
        let urlSession = URLSession.shared
        
        //get a data task from url session object
        let dataTask = urlSession.dataTask(with: url!) { (data, respose, error) in
            
            if error != nil || data == nil {
                
                return
                
            }
            
            //parsing data into video objects
            
        }
        
        //kick off the task
        dataTask.resume()
        
        
    }
    
}

//
//  Model.swift
//  youtube-clone
//
//  Created by Atul Kumar on 12/01/21.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
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
            
            do{
                
                //parsing data into video objects
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        //call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                        
                    }
                    
                }
                
                dump(response)
                
            }
            catch{
                
                
                
            }
            
        }
        
        //kick off the task
        dataTask.resume()
        
        
    }
    
}

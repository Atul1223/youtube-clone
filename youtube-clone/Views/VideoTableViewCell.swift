//
//  VideoTableViewCell.swift
//  youtube-clone
//
//  Created by Atul Kumar on 19/01/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dateLable: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcell(_ v:Video) {
        
        self.video = v
        
        //ensure we have a video
        guard self.video != nil else {
            return
        }
        
        //set title and date label
        self.titleLable.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLable.text = df.string(from: video!.published)
        
        //set thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //check cache before downloading the data
        if let cachedData = CascheManager.getVideoCache(self.video!.thumbnail) {
            
            //set the thumnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        //Download thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //get the shared URL session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                //save the data in the cache
                CascheManager.setVideoCashe(url!.absoluteString, data)
                
                //check that the downloded url matches the video thumbnail url that this url cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    
                    //video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                    
                }
                
                //create image boject
                let image = UIImage(data: data!)
                
                
                //set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        //start data task
        dataTask.resume()
    }

}

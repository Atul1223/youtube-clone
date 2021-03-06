//
//  ViewController.swift
//  youtube-clone
//
//  Created by Atul Kumar on 10/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as delegate as the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the delgate of the model
        model.delegate = self
        
        model.getVideos()
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //confirm a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a reference to the detail view controller
        let detailedVc = segue.destination as! DetailedViewController
        
        //set the video proprerty of the detailed view controller
        detailedVc.video = selectedVideo
        
    }
    
    
    //MARK: - ModelDelegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        //Set the returned video to our video property
        self.videos = videos
        
        //refresh the tableview
        tableView.reloadData()
        
    }
    
    // MARK: - tableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with data
        
        let video = self.videos[indexPath.row]
        
        cell.setcell(video)
        
        
        //return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}


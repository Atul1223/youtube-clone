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
    var videos = [video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set itself as delegate as the data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the delgate of the model
        model.delegate = self
        
        model.getVideos()
        
       
    }
    
    //MARK: - ModelDelegate methods
    
    func videosFetched(_ videos: [video]) {
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //configure the cell with data
        //get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        //return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}


//
//  DetailedViewController.swift
//  youtube-clone
//
//  Created by Atul Kumar on 19/01/21.
//

import UIKit
import WebKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dateLable: UILabel!
    
    @IBOutlet weak var WebView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        
        //clear the fields
        titleLable.text = ""
        dateLable.text = ""
        textView.text = ""
        
        //check if there is a video
        guard video != nil else {
            return
        }
        // Create the embed URL
                let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
                
                // Load it into the webview
                let url = URL(string: embedUrlString)
                let request = URLRequest(url: url!)
                WebView.load(request)
                
                // Set the title
                titleLable.text = video!.title
                
                // Set the date
                let df = DateFormatter()
                df.dateFormat = "EEEE, MMM d, yyyy"
                dateLable.text = df.string(from: video!.published)
                
                // Set the description
                textView.text = video!.description
            }

}

//
//  ViewController.swift
//  youtube-clone
//
//  Created by Atul Kumar on 10/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
       
    }


}


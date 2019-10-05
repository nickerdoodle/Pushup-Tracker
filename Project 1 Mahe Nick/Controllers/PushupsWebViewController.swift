//
//  PushupsWebViewController.swift
//  Project 1 Mahe Nick
//
//  Created by Nick Mahe on 10/4/19.
//  Copyright © 2019 Nick Mahe. All rights reserved.
//

import Foundation
import WebKit

class PushupsWebViewController: UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    let urlString = "https://hundredpushups.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: urlString){
            webView.load(URLRequest(url: url))
        }
        else{
            webView.loadHTMLString("<h1>Unable to connect to www.HundredPushups.com</h1>", baseURL: nil)
        }
        
    }
    
    
}

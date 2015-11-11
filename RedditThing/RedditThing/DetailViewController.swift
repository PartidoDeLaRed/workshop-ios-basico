//
//  DetailViewController.swift
//  TwitterTest1
//
//  Created by Alejandro Santander on 11/8/15.
//  Copyright © 2015 Alejandro Santander. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    @IBOutlet var loadingLabel: UILabel!
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        if(url.characters.count > 0) {
            loadURL(self.url)
        }
    }
    
    func loadURL(url:String) {
        
        print("DVC - loadURL: \(url)")
        
        self.url = url
        
        // Load URL if the web view has been initialized and the url is ready
        if let webView = self.webView {
            
            webView.hidden = true
            loadingLabel.hidden = false
            
            let requestURL = NSURL(string:url)
            let request = NSURLRequest(URL: requestURL!)
            webView.loadRequest(request)
        }
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: UIWebVIewDelegate
    // ---------------------------------------------------------------------------------------------
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webView.hidden = false
        loadingLabel.hidden = true
    }
}




























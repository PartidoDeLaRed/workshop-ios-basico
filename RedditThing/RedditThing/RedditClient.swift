//
//  RedditClient.swift
//  RedditThing
//
//  Created by Alejandro Santander on 10/20/15.
//  Copyright © 2015 Alejandro Santander. All rights reserved.
//

import Foundation
import SwiftyJSON

class RedditClient: NSObject {
    
    // ---------------------------------------------------------------------------------------------
    // MARK: PROPERTIES
    // ---------------------------------------------------------------------------------------------
    
    static let instance = RedditClient()
    
    var reddits:[Reddit] = []
    
    // ---------------------------------------------------------------------------------------------
    // MARK: NOTIFICATIONS
    // ---------------------------------------------------------------------------------------------
    
    static let NOTIFICATION_DATA_FETCHED = "REDDIT_CLIENT_NOTIFICATION_DATA_FETCHED"
    
    // ---------------------------------------------------------------------------------------------
    // MARK: API CALLS
    // ---------------------------------------------------------------------------------------------
    
    func getData() {
        
        print("RedditClient - getRedditData()...")
        
        // Construct GET request.
        let requestURL = NSURL(string:"http://www.reddit.com/top/.json?limit=50")!
        let request = NSMutableURLRequest(URL: requestURL)
        request.HTTPMethod = "GET"
        
        // Async GET
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            print("RedditClient - Data retrieved.")
            
            if error != nil {
                print("error retrieving data")
                return
            }
            
            let json = JSON(data: data!)
            //            print("json: \(json)")
            
            let reddits = json["data"]["children"]
            for (_, entry) in reddits {
                let reddit = Reddit(json: entry)
                self.reddits.append(reddit)
            }
            
            // Notify (in main thread)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                NSNotificationCenter.defaultCenter().postNotificationName(RedditClient.NOTIFICATION_DATA_FETCHED, object: nil);
            })
        }
        task.resume()
    }
}



















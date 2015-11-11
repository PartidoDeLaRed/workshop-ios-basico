//
//  ViewController.swift
//  RedditThing
//
//  Created by Alejandro Santander on 11/10/15.
//  Copyright © 2015 Alejandro Santander. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    // ---------------------------------------------------------------------------------------------
    // MARK: VIEW LIFE CYCLE
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RedditClient.instance.getData()
        
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onRedditDataFetched", name: RedditClient.NOTIFICATION_DATA_FETCHED, object: nil)
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: SEGUES
    // ---------------------------------------------------------------------------------------------
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ToDetailSegue" {
            
            let indexPath = tableView.indexPathForSelectedRow!
            let reddit = RedditClient.instance.reddits[indexPath.row]
            
            let controller = segue.destinationViewController as! DetailViewController
            controller.loadURL(reddit.url)
        }
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: NOTIFICATIONS
    // ---------------------------------------------------------------------------------------------
    
    func onRedditDataFetched() {
        tableView.reloadData()
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: UITableViewDataSource
    // ---------------------------------------------------------------------------------------------
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RedditClient.instance.reddits.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTableCell")!
        
        let reddit = RedditClient.instance.reddits[indexPath.row]
        
        cell.textLabel!.text = reddit.title
        cell.detailTextLabel!.text = reddit.author
        print("cell \(indexPath.row).")
        
        return cell
    }
}





























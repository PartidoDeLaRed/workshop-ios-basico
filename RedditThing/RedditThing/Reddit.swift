//
//  Reddit.swift
//  RedditThing
//
//  Created by Alejandro Santander on 10/20/15.
//  Copyright © 2015 Alejandro Santander. All rights reserved.
//

import UIKit
import SwiftyJSON

class Reddit: NSObject {
    
    // ---------------------------------------------------------------------------------------------
    // MARK: PROPERTIES
    // ---------------------------------------------------------------------------------------------
    
    var title:String = ""
    var author:String = ""
    var url:String = ""
    
    // ---------------------------------------------------------------------------------------------
    // MARK: INIT
    // ---------------------------------------------------------------------------------------------
    
    init(json:JSON) {
        
        //        print("Reddit - init()")
        
        let data = json["data"]
        
        self.title = data["title"].stringValue
        self.author = data["author"].stringValue
        self.url = data["url"].stringValue
        // ...
    }
}





























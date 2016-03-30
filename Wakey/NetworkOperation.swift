//
//  NetworkOperation.swift
//  Wakey
//
//  Created by Richard Hsu on 3/29/16.
//  Copyright © 2016 Richard Hsu. All rights reserved.
//

import Foundation

class NetworkOperation
{
    //lazy var config: NSURLSessonConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    //lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    init(url: NSURL)
    {
        self.queryURL = url
    }
    
}

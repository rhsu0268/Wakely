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
    
    // goal: download json
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    // give an alternative name for something in a program 
    // dictinary parameter - return type of void
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    // initialize the query url
    init(url: NSURL)
    {
        self.queryURL = url
    }
    
    
    // single parameter - closure (completion)
    func downloadJSONFromURL(completion: JSONDictionaryCompletion)
    {
        
        // make a request and use query url to initialize it
        let request: NSURLRequest = NSURLRequest(URL: queryURL)
        
        // trailing closure since it's the last argument
        // closure is last argument - trailing closure
        let dataTask = session.dataTaskWithRequest(request)
        {
            // parameters of the closure
            (let data, let response, let error) in
            
            // 1. Check HTTP response for successful GET request
            
            // cast response to NSHTTPURLResponse using optional binding since that's where the status code is
            if let httpResponse = response as? NSHTTPURLResponse
            {
                switch(httpResponse.statusCode)
                {
                    // test for success - need to include other cases
                    case 200:
                        // 2. create a JSON objectwith data
                        // NSJSONSerlization
                        // pass in data from the datatask
                        // NSJSONSERialization: Convert Json objects and foundation - dictionary and arrays
                        // options: Specify the way data object is converted to JSON one
                        // use default - []
                        // returns an anyobject type - cast it to [String: AnyObject] (dictionary)
                        do {
                            let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
                            
                            // return the dictionary with the completion handler
                            completion(jsonDictionary)
                        } catch let error {
                            print("JSON Serialization failed. Error: \(error)")
                    }
                    default:
                        print("GET request not successful. HTTP status code: \(httpResponse.statusCode)")
                }
            }
            else
            {
                print("Error: Not a valid HTTP response")
            }
            
            
        }
        // Right after you create the task, you need to start it
        dataTask.resume()
    }
    
}

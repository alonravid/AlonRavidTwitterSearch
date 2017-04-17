//
//  TweetsSearch.swift
//  AlonRavidTwitterSearch
//
//  Created by Alon Ribovsky on 4/17/17.
//  Copyright © 2017 Alon Ribovsky. All rights reserved.
//

import UIKit

class TweetsSearch: NSObject {
    
    override init(){
        
    }
    
    func searchTweets(_ text: String){
        
        let tweeterUrlString = "https://api.twitter.com/1.1/search/tweets.json?q=%23superbowl&result_type=recent"
        
        let tweeterUrl = NSURL(string: tweeterUrlString)
        
        let request = URLRequest(url: tweeterUrl! as URL)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            
            if error == nil{
                
                var tweetsArray : [String:Any] = [:]
                do{
                    tweetsArray = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                }catch let error as NSError {
                    print(error)
                }
                
                for tweet in tweetsArray{
                    print ("the tweet is : \(tweet)")
                    
                }
            }
        }
        
        task.resume()
    }

}

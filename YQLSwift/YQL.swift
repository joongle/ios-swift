//
//  YQL.swift
//  YQLSwift
//
//  Created by Jake Lee on 1/25/15.
//  Copyright (c) 2015 JHL. All rights reserved.
//

import Foundation

struct YQL {
    private static let prefix:NSString = "http://query.yahooapis.com/v1/public/yql?&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=&q="
    
    static func query(statement:String) -> NSDictionary? {

        var escapedStatement = statement.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        let query = "\(prefix)\(escapedStatement!)"

        var results:NSDictionary? = nil
        var jsonError:NSError? = nil

        let jsonData = NSData(contentsOfURL: NSURL(string: query)!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &jsonError)

        if jsonData != nil {
            results = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments, error: &jsonError) as NSDictionary?
        }
        if jsonError != nil {
            NSLog( "ERROR while fetching/deserializing YQL data. Message \(jsonError!)" )
        }
        return results
    }
}

//
//  ViewController.swift
//  YQLSwift
//
//  Created by Jake Lee on 1/25/15.
//  Copyright (c) 2015 Jake Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var queryTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var resultsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapSend(sender: UIButton) {
        let results = YQL.query(queryTextView.text)
        let queryResults = results?.valueForKeyPath("query.results") as NSDictionary?
        if queryResults != nil {
            NSLog( "query.results: \(queryResults)" )
            resultsTextView.text = queryResults!.description
        }
    }
}


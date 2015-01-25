yql-swift
yql-swift is an Objective-C library that provides YQL connectivity for your iOS applications.

YQL (Yahoo! Query Language) is an expressive SQL-like language that lets you query, filter, and join data across Web services. With YQL, apps run faster with fewer lines of code and a smaller network footprint.

Usage

Import YQL.swift into your project. Use the query method to invoke YQL, passing the desired query as a parameter:

  let results = YQL.query("SELECT * FROM weather.forecast WHERE woeid=2502265")
  let queryResults = results?.valueForKeyPath("query.results") as NSDictionary?
  NSLog( "query.results: \(queryResults)" )

You will receive an NSDictionary object containing the results.
The structure of this dictionary is the same you would get from a query in the YQL console.
You can use valueForKeyPath to access the desired data in the results structure:

See it in action:
This repository is an Xcode project that mimics the YQL console. You can run it on Xcode to see how it works.
Run the project to see a sample YQL console interface on iOS.

This project borrows from 'guilhermechapiewski/yql-ios', which contains the same content in objective-c

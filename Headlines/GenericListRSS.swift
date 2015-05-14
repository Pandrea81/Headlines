//
//  GenericListRSS.swift
//  Headlines
//
//  Created by Ferdinando Furci on 14/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import UIKit

class GenericListRSS: UITableViewController, NSXMLParserDelegate {

     let RSSarray = ["http://www.repubblica.it/rss/homepage/rss2.0.xml", "http://www.gazzetta.it/rss/home.xml"]
     var mParser = Parser()
     var mRSSURL1 : NSURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mRSSURL1 = NSURL(string: RSSarray[0])!
        mParser.loadRSS(mRSSURL1)
        
        println("\(FeedsSingleton.feedArray)")
        

      
    }
    
    
    
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return FeedsSingleton.feedArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! RSSCell
        
       
        
        
            cell.mTitle.text = FeedsSingleton.feedArray.objectAtIndex(indexPath.row).valueForKey("title")  as? String
        
        
       
       

        return cell
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}

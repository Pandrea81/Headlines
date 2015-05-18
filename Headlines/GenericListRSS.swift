//
//  GenericListRSS.swift
//  Headlines
//
//  Created by Ferdinando Furci on 14/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class GenericListRSS: UITableViewController, NSXMLParserDelegate {

  
    
    let titoloKey = "titolo"
    let linkKey = "url"
    var feed : Feed?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
      
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var query = PFQuery(className: "feeds")
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                println("Ho ottenuto \(objects!.count) feed.")
                
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        
                        //in feed è contenuto anche il link da mandare nella WebView tramite la segue
                        
                        self.feed = Feed(title:object.objectForKey(self.titoloKey) as! String , URL: object.objectForKey(self.linkKey) as! String, imgLink: nil)
                             self.tableView.reloadData()
                        
                    }
                }
            } else {
                
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
        
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
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! RSSCell
        
       
        
            cell.mTitle.userInteractionEnabled = false
        
            cell.mTitle.text = feed?.title
        
        
        
       
       

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}

//
//  RSSTableViewController.swift
//  Headlines
//
//  Created by Ferdinando Furci on 08/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import UIKit

class RSSTableViewController: UITableViewController , NSXMLParserDelegate {
    
    var mRSSURLString : String?

    var mRSSURL : NSURL = NSURL()
    var mURL : String?
    var mParser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    var link = NSMutableString()
    var valueToPass:String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mRSSURL = NSURL(string: mRSSURLString!)!
        loadRSS(mRSSURL)
        
        
        
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        element = elementName
        
        if (elementName as NSString).isEqualToString("item"){
            
            elements = NSMutableDictionary.alloc()
            elements = [:]
            title1 = NSMutableString.alloc()
            title1 = ""
            date = NSMutableString.alloc()
            date = ""
            link = NSMutableString.alloc()
            link = ""
            
            
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        
        if element.isEqualToString("title") {
            title1.appendString(string!)
            
            
        } else if element.isEqualToString("pubDate") {
            date.appendString(string!)
        }else if element.isEqualToString("link"){
            link.appendString(string!)
        }
        
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if (elementName as NSString).isEqualToString("item") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "title")
                
            }
            if !link.isEqual(nil) {
                elements.setObject(link, forKey: "link")
            }
            
            posts.addObject(elements)
            println("\(posts)")
        }
        
    }
    
    
    func loadRSS(data: NSURL){
        
        mParser = NSXMLParser(contentsOfURL: mRSSURL)!
        mParser.delegate = self
        mParser.parse()
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return posts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RSScell", forIndexPath: indexPath) as! UITableViewCell
        
         cell.textLabel?.text =  posts.objectAtIndex(indexPath.row).valueForKey("title")  as? String
       
        
        
        return cell
    }
   
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }
    
    
    
}




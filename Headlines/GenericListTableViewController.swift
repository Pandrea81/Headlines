//
//  GenericListTableViewController.swift
//  Headlines
//
//  Created by Ferdinando Furci on 07/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import UIKit


class RSScell: UITableViewCell {
    
    
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    
    
    @IBOutlet weak var mDescription: UITextView!
     override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
}

class GenericListTableViewController: UITableViewController, NSXMLParserDelegate {
   
    
    
    let array = ["http://www.repubblica.it/rss/homepage/rss2.0.xml", "http://www.gazzetta.it/rss/home.xml"]
   
    var mRSSURL1 : NSURL = NSURL()
    var mRSSURL2 : NSURL = NSURL()
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
        mRSSURL1 = NSURL(string: array[0])!
        mRSSURL2 = NSURL(string: array[1])!
        loadRSS(mRSSURL1)
        loadRSS(mRSSURL2)
        
        
        
        
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
        
        if elementName == "enclosure" {
            
            let attrsUrl = attributeDict as! [String: NSString]
            var urlPic = attrsUrl["url"]
            
            elements.setObject(urlPic!, forKey: "enclosure")
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
        
        mParser = NSXMLParser(contentsOfURL: data)!
        mParser.delegate = self
        mParser.parse()
        
        
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! RSScell

        let imageURL = NSURL(string: posts.objectAtIndex(indexPath.row).valueForKey("enclosure")!.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        
        let data = NSData(contentsOfURL: imageURL!)
        
        let image = UIImage(data: data!)
        
        
        cell.mTitle.text =  posts.objectAtIndex(indexPath.row).valueForKey("title")  as? String
        cell.mDescription.text = "blablablablablablaahahahaagduaudgòJDajdaJFPajfòFJòlafjòLJAFòalj"
        cell.mDescription.editable = false
        cell.mDescription.userInteractionEnabled = true
        cell.mImage.image = image

        return cell
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("mySegue", sender: self)
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
        
        if segue.identifier == "mySegue"{
            
            let vc = segue.destinationViewController as! RSSTableViewController
            
            let index = self.tableView.indexPathForSelectedRow()!
            
            let mSelectedFeed: AnyObject = posts[index.row]
            vc.mRSSURLString = mSelectedFeed as! String
            
        
    }
    
    }
    
}



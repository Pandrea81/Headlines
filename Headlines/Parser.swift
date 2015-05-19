//
//  Parser.swift
//  Headlines
//
//  Created by Ferdinando Furci on 14/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import Foundation
import UIKit

class Parser : NSXMLParser, NSXMLParserDelegate {
    
    var mParser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    var link = NSMutableString()
    
    
    
    convenience init(contentsOfURL url: NSURL!){
            self.init()
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
            
            
            
     //       FeedsSingleton.feedArray.addObject(elements)
            
      
        }
        
        
        
    }
    func loadRSS(data: NSURL){
        
        mParser = NSXMLParser(contentsOfURL: data)!
        mParser.delegate = self
        mParser.parse()
        
        
        
    }
    
}

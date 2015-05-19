//
//  Feed.swift
//  Headlines
//
//  Created by Ferdinando Furci on 14/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import Foundation


var feedList : Feeds = Feeds()

struct Feed {
    
    var title : String // titolo della notizia
    var URL : String   // url per aprire la webview
    var imgLink : String? // immagine da visualizzare nella tableview
    
    // inserire altri campi?
    
}


class Feeds {
    
    var feedArray = [Feed]()
    
    
    
    
    
}
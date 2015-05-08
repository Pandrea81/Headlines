//
//  ProvaViewController.swift
//  Headlines
//
//  Created by Ferdinando Furci on 07/05/15.
//  Copyright (c) 2015 The AppDate. All rights reserved.
//

import UIKit

class ProvaViewController: UIViewController {
    
    var ciao : Int = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        println("Ciao sono prova : \(ciao)" )
        ciao = ciao + 1
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Video.swift
//  YoutubeClone
//
//  Created by rawat on 21/01/17.
//  Copyright © 2017 Pankaj Rawat. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel? 
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}

//
//  Notice.swift
//  Assignment11
//
//  Created by DCS on 20/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class Notice {
    
    var NoticeID : Int = 0
    var NoticeTitle : String = ""
    var NoticeDate : String = ""
    var NoticeDescription : String = ""
    var Class : String = ""
    
    init(NoticeID: Int, NoticeTitle: String, NoticeDate: String, NoticeDescription: String, Class: String)
    {
        self.NoticeID = NoticeID
        self.NoticeTitle = NoticeTitle
        self.NoticeDate = NoticeDate
        self.NoticeDescription = NoticeDescription
        self.Class = Class
    }
}

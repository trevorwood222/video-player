//
//  fetchPlaylistCompletion.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
import UIKit

extension Services {
    
    static func fetchPlaylistCompletion(status:Int,code:Int,message:String,error:String,result:[FetchPlaylistsResult]?){
        
        if Utils.isValidCode(code: code) && Utils.isValidStatus(status: status){
            self.updateViews()
        }
    }
}


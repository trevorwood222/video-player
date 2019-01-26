//
//  Utils.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
import UIKit
import PassKit

struct Utils{
    
    static func isValidStatus(status:Int) -> Bool{
        return status >= 200 && status <= 299
    }
    static func isValidCode(code:Int) -> Bool{
        return code >= 0 && code <= 999
    }
    
}

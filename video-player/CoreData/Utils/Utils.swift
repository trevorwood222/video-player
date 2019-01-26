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
    
    static func milliSecondsToMinutesAndSeconds(milliseconds:Int) -> (Int,Int){
        let duration = milliseconds/1000
        let minutes:Int = Int(floor(Double(duration/60)))
        let seconds = duration%60
        return (minutes,seconds)
    }
    
    static func displayMilisecondsAsTime(milliseconds:Int) -> String {
        let (minutes,seconds) = milliSecondsToMinutesAndSeconds(milliseconds: milliseconds)

        var checkSeconds = "\(seconds)"
        if seconds <= 9 {
            checkSeconds = "0\(seconds)"
        }

        return "\(minutes):\(checkSeconds)"
    }
}

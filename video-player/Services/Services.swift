//
//  Services.swift
//  video-player
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import Foundation
struct Services {
    static var videos:[Video] = []
}

struct StandardServiceResponse: Codable {
    let status:Int
    let code:Int
    let message:String
    let error:String
}

struct StandardErrorResponse{
    static var status:Int = -1
    static var code:Int = -1
    static var message:String = "Error connecting with the server"
    static var error:String = "Error connecting with the server"
    static var dataUnpackError:String = "Data could not be unpacked"
    static var responseDecodeError:String = "Response could not be decoded"
    static var resultsDecodeError:String = "Results could not be decoded"
}


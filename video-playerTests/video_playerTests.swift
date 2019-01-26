//
//  video_playerTests.swift
//  video-playerTests
//
//  Created by Trevor Wood on 2019/01/26.
//  Copyright © 2019 Trevor Wood. All rights reserved.
//

import XCTest
@testable import video_player

class video_playerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchVideos() {
        let expect = expectation(description: "testFetchVideos")
        var responseReceived = false
        
        Services.fetchPlaylists(completion:
                {(status:Int, code:Int, error:String, message:String, result:[FetchPlaylistsResult]?) in
                    responseReceived = true
     
                    print("status: \(status)")
                    print("code: \(code)")
                    print("error: \(error)")
                    print("message: \(message)")
                    print(result)
                    
                    XCTAssert(Utils.isValidCode(code: code))
                    XCTAssert(Utils.isValidStatus(status: status))
                
                    if let result = result{
                        XCTAssert(result.count >= 1)
                        XCTAssert(Services.videos.count >= 1)
                    }else{
                        XCTAssert(false, "FetchPlaylistsResult is nil")
                    }
                    
                    expect.fulfill()
                    
        })
        
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssert(responseReceived)
    }
}

//
//  APISession.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by joshua on 9.12.2020.
//

import Alamofire

final class APISession {
    static var shared = APISession()
    
    let session: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.timeoutIntervalForResource = 30.0
        self.session = Session(configuration: configuration, eventMonitors: [Logger()])
    }
}

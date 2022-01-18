//
//  BaseResponse.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by joshua on 18.03.2021.
//

import Foundation

struct BaseResponse: Codable {

    var message: String
    var messageId: String
    var isSuccess: Bool

    internal enum CodingKeys: String, CodingKey {
        case message = "Message"
        case messageId = "MessageId"
        case isSuccess = "IsSucces"
    }
}

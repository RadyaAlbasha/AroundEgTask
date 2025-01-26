//
//  ErrorMessage.swift
//  AroundEgyptTask
//
//  Created by Radya Albasha on 25/01/2025.
//

import Foundation
enum ErrorMessage: String, Error{
    case SERVER_MESSAGE = "Server is down"
    case NO_CONNECTION = "The Internet connection appears to be offline"
    case NO_DATA = "No Data available"
    case INVALID_CONFIGRATION = "invalid configration"
}

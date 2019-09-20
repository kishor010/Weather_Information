//
//  Helper.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias dict = [String: AnyObject]
typealias dictString = [String: String]
typealias dictAny = [String: Any]
typealias onSuccess = (JSON)->()
typealias onFailure = (String)->()

class Helper {
    static let PROGRESS_INDICATOR_VIEW_TAG:Int = 10
}

//
//  AppError.swift
//  DIDemo
//
//  Created by Kunal Pandey on 04/09/20.
//  Copyright © 2020 Kunal Pandey. All rights reserved.
//

import Foundation

enum AppError: Error {
  static var urlError: Error {
    return NSError(domain: "Invalid Url", code: 8889, userInfo: [NSLocalizedFailureReasonErrorKey : "Invalid Url"]) as Error
  }
}

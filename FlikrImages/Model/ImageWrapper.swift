//
//  ImageWrapper.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI

struct ImageWrapper: Codable {
    let title, link, description, modified, generator: String
    let items: [ImageItem]
}

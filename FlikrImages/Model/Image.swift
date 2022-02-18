//
//  Image.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI

struct ImageItem: Codable, Identifiable {
    var id = UUID()
    let title, link, date_taken, description, published, author, author_id, tags: String
    let media: Media
    
    private enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case date_taken
        case description
        case published
        case author
        case author_id
        case tags
    }
    
    func getImageSize() -> String {
        var size = ""
        if let widthRange = description.range(of: "width=") {
            let width = description[widthRange.upperBound...].prefix(4).dropFirst()
            size = "Width: \(width), "
        }
        
        if let heightRange = description.range(of: "height=") {
            let height = description[heightRange.upperBound...].prefix(4).dropFirst()
            size.append("height: \(height)")
        }
        
        return size
    }
    
    func getDateFormatted() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy h:mm a"

        if let date = dateFormatterGet.date(from: published) {
            return "Published: " + (dateFormatterPrint.string(from: date))
        } else {
            return "Published: N/A"
        }
    }
}

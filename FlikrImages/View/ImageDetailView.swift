//
//  ImageDetailView.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI
import Kingfisher

struct ImageDetailView: View {
    
    let imageItem: ImageItem
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    KFImage(URL(string: imageItem.media.m))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, alignment: .leading)
                        .cornerRadius(20)
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(imageItem.title)
                        .frame(alignment: .leading)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.top, 4)
                    Text(imageItem.getDateFormatted())
                        .frame(alignment: .leading)
                        .font(.system(size: 14, weight: .regular))
                    Text(imageItem.getImageSize())
                        .frame(alignment: .leading)
                        .font(.system(size: 14, weight: .regular))
                    Text(imageItem.author)
                        .frame(alignment: .leading)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                    Text(imageItem.description)
                        .frame(alignment: .leading)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(20)
            Spacer()
        }
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(imageItem: ImageItem(title: "Test", link: "test", date_taken: "test", description: "test", published: "test", author: "test", author_id: "test", tags: "test", media: Media(m: "test")))
    }
}

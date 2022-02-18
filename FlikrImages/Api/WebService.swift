//
//  WebService.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import Foundation

class WebService {
    func getImages(_ text: String, completion: @escaping ([ImageItem]) -> (Void)) {
        
        let cleanedText = text.filter { !$0.isWhitespace }
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(cleanedText)"
        guard let url = URL(string: urlString) else {
            print("Error constructing url")
            return
        }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error getting data: \(String(describing: error))")
            } else {
                
                guard let data = data else {
                    print("Error data no found")
                    return
                }
                
                do {
                    let imageWrapper = try JSONDecoder().decode(ImageWrapper.self, from: data)
                    DispatchQueue.main.async {
                        completion(imageWrapper.items)
                    }
                    
                } catch {
                    print("Error parsing data: \(String(describing: error))")
                }
            }
        }
        
        .resume()
    }
    
}

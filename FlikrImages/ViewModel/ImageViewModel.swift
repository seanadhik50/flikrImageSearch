//
//  ImageViewModel.swift
//  FlikrImages
//
//  Created by Sean Adhikari on 2/17/22.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var images = [ImageItem]()
    func getImages(_ text: String = "porcupine") {
        WebService().getImages(text) { [weak self] images in
            self?.images = images
        }
    }
}

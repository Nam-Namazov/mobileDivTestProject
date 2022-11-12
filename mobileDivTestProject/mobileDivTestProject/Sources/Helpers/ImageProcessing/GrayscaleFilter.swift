//
//  GrayscaleFilter.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Kingfisher

final class GrayscaleFilter: ImageProcessor {

    let identifier = ""
    private let isGrayscale: Bool
    
    init(_ isGrayscale: Bool) {
        self.isGrayscale = isGrayscale
    }

    func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            return isGrayscale ? ImageProcessing.makeGrayscaleImage(image) : image
        case .data:
            return (DefaultImageProcessor.default |> self).process(item: item, options: options)
        }
    }
}

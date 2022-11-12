//
//  ImageProcessing.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import UIKit

enum ImageProcessing {
    
    private static let context = CIContext(options: nil)
    
    static func makeGrayscaleImage(_ image: UIImage) -> UIImage {
        let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        currentFilter!.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!,from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
}

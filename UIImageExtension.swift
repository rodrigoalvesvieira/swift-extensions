//
//  UIImageExtension.swift
//
// Thanks to my friend Leo Dabus for the rounded and circle methods

import UIKit

extension UIImage {
    var rounded: UIImage {
        let imageView = UIImageView(image: self)

        imageView.layer.cornerRadius = size.height < size.width ? size.height/2 : size.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.renderInContext(UIGraphicsGetCurrentContext())

        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return result
    }

    var circle: UIImage {
        let square = size.width < size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))

        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true

        UIGraphicsBeginImageContext(imageView.bounds.size)

        imageView.layer.renderInContext(UIGraphicsGetCurrentContext())

        let result = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return result
    }

    /// Takes an image and creates and returns a new one rotated in 90 degrees so that it is not ruined by `UIImagePNGRepresentation`.
    /// This method makes sure the image is represented in portrait orientation mode instead of landscape.
    ///
    ///  :param: item           The image to be set to the right orientation.
    ///
    ///  :returns: A new, properly oriented `UIImage` that is a copy of the original one.
    var portraitify: UIImage {
        let size = self.size

        UIGraphicsBeginImageContext(size)

        self.drawInRect(CGRectMake(0, 0, size.width, size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

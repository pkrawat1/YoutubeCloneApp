//
//  Extensions .swift
//  YoutubeClone
//
//  Created by Pankaj Rawat on 20/01/17.
//  Copyright © 2017 Pankaj Rawat. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        let url = NSURL(string: urlString)
        let configuration = URLSessionConfiguration.default
        
        let urlRequest = URLRequest(url: url as! URL)
        
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: urlRequest) { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
                return
            }
                
            else {
                do {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data!)
                    }
                    return
                }
                catch let error as NSError {
                    print(error)
                }
            }
            }.resume()
    }
}

//
//  ViewController.swift
//  testing
//
//  Created by Pankaj Rawat on 20/01/17.
//  Copyright © 2017 Pankaj Rawat. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent =  false
        
//        let titleLabel = UILabel(frame: <#T##CGRect#>))
//        navigationItem.titleView = titleLabel
        
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 +  68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


class VideoCell:  UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "thumbnail")
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pankaj Rawat"
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Amazing View of eiffel tower."
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.gray
        return textView
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constrain
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute:  .top, relatedBy: .equal, toItem: thumbnailImageView , attribute: .bottom, multiplier: 1, constant: 8 ))
        // left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right , relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // hight Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute:  .top, relatedBy: .equal, toItem: titleLabel , attribute: .bottom, multiplier: 1, constant: 4 ))
        // left constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right , relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // hight Constraint
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

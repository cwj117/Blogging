//
//  UnownedVsWeakViewController.swift
//  UnownedVsWeak
//
//  Created by MAC241 on 10/16/18.
//  Copyright © 2018 MAC241. All rights reserved.
//

import UIKit

enum ReferenceChoice {
    case unowned
    case weak
    case none
}

class UnownedVsWeakViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var referenceChoice: ReferenceChoice = .none
    let imageToBeShown = "https://images.pexels.com/photos/221433/pexels-photo-221433.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // curve the imageview.
        self.imageView.layer.cornerRadius = 8.0
        self.imageView.clipsToBounds = true
        
        switch self.referenceChoice {
        case .unowned:
            self.tryUnowned()
        case .weak:
            self.tryWeak()
        case .none:
            print("No action to be taken")
        }
    }
    
    func tryUnowned() {
        // let's get image data from server to load it in our imageview.
        self.getData(from: URL.init(string: self.imageToBeShown)!) { [unowned self] (data, response, error) in
            DispatchQueue.main.async {
                    self.imageView.image = UIImage.init(data: data!)
            }
        }
    }
    func tryWeak() {
        // let's get image data from server to load it in our imageview.
        self.getData(from: URL.init(string: self.imageToBeShown)!) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage.init(data: data!)
            }
        }
    }
    func tryNone() {
        // let's get image data from server to load it in our imageview.
        self.getData(from: URL.init(string: self.imageToBeShown)!) { (data, response, error) in
            DispatchQueue.main.async {
                self.imageView.image = UIImage.init(data: data!)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    deinit {
        print("Unowned Vs Weak Controller deallocated")
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

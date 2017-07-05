//
//  ViewController.swift
//  bai2DownloadImage
//
//  Created by Cntt36 on 7/5/17.
//  Copyright © 2017 nhom5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLoad1: UIImageView!
    
    @IBOutlet weak var imgLoad2: UIImageView!
    
    @IBOutlet weak var txtLoad1: UITextField!
    
    @IBOutlet weak var txtLoad2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnLoadImage(_ sender: Any) {
        if (txtLoad1.text == "" || txtLoad2.text == "")   {
            let alert = UIAlertController(title: "Error", message:"please input link image", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let link1 = txtLoad1.text
            let link2 = txtLoad2.text
            downloadImangeURL(link1!, link2!)
            
        }
    }
    func downloadImangeURL(_ link1: String, _ link2: String) {
        let imgLink1 = URL(string: link1)
        let imgLink2 = URL(string: link2)
        (URLSession(configuration: .default)).dataTask(with: imgLink1!, completionHandler: {(dataImage1, response, Error) in
            if let data = dataImage1 {
                DispatchQueue.main.async() { () -> Void in
                    self.imgLoad1.image = UIImage(data: data)
                }
            }
        }).resume()
        
        (URLSession(configuration: .default)).dataTask(with: imgLink2!, completionHandler: {(dataImage2, response, Error) in
            if let data = dataImage2 {
                DispatchQueue.main.async() { () -> Void in
                    self.imgLoad2.image = UIImage(data: data)
                }
            }
        }).resume()

    }
}


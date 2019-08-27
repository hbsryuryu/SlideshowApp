//
//  big_image_ViewController.swift
//  SlideshowApp
//
//  Created by 濱田龍輝 on 2019/08/27.
//  Copyright © 2019 Ryuuki.hamada. All rights reserved.
//

import UIKit

class big_image_ViewController: UIViewController {

    var image_big_name = "error"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_big.image = UIImage(named: "\(image_big_name)")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var image_big: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

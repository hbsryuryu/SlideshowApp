//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 濱田龍輝 on 2019/08/27.
//  Copyright © 2019 Ryuuki.hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var timer_sec: Int = 0
    let moji_set = ["再生/停止","停止","次へ","戻る",""]
    var image_set = ["empty"]
    var image_set_count = 16
    var image_max_count = 0
    var image_main_number = 0
    var image_next_number = 0
    var image_back_number = 0
    var image_send_name = "error"
    
    
    @IBOutlet weak var print: UILabel!
    @IBOutlet weak var button_auto_stop: UIButton!
    @IBOutlet weak var button_next: UIButton!
    @IBOutlet weak var button_back: UIButton!
    @IBOutlet weak var button_goto_big_main: UIButton!
    @IBOutlet weak var button_goto_big_next: UIButton!
    @IBOutlet weak var button_goto_big_back: UIButton!
    @IBOutlet weak var image_main: UIImageView!
    @IBOutlet weak var image_next: UIImageView!
    @IBOutlet weak var image_back: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_max_count = image_set_count - 1
        image_back_number = image_max_count
        image_next_number = image_main_number + 1
        image_array_setup()
        image_apply_func()
        print.text = "\(moji_set[4])"
        //print.text = "\(image_set)"
        button_moji_setup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let big_image_side_ViewController:big_image_ViewController = segue.destination as! big_image_ViewController
        big_image_side_ViewController.image_big_name = image_send_name
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func button_return(_ segue: UIStoryboardSegue) {
    }

    @IBAction func button_goto_big_main(_ sender: Any) {
        image_send_name = image_set[image_main_number]
        if (self.timer != nil){
             auto_cancle()
        }
    }
    
    @IBAction func button_goto_big_next(_ sender: Any) {
        image_send_name = image_set[image_next_number]
        if (self.timer != nil){
            auto_cancle()
        }
    }
    
    @IBAction func button_goto_big_back(_ sender: Any) {
        image_send_name = image_set[image_back_number]
        if (self.timer != nil){
            auto_cancle()
        }
    }
    
    @IBAction func auto_stop(_ sender: Any) {
        if (self.timer == nil){
            button_swich(flug :"off")
            button_auto_stop.setTitle("\(moji_set[1])", for: UIControl.State())
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(auto_side(_:)), userInfo: nil, repeats: true)
        }else{
            auto_cancle()
        }
    }
    @IBAction func button_next(_ sender: Any) {
        image_next_func()
        image_apply_func()
    }
    
    @IBAction func butto_back(_ sender: Any) {
        image_back_func()
        image_apply_func()
    }
    
    @objc func auto_side(_ timer: Timer) {
        image_next_func()
        image_apply_func()
        //self.timer_sec += 2
        //self.print.text = String(timer_sec)
    }
    
    func image_array_setup(){
        for i in 1...image_set_count{
            image_set.append("image_" + String(i))
        }
        image_set.removeFirst()
        return image_set = image_set.shuffled()
    }
    
    func image_apply_func(){
        image_main.image = UIImage(named: "\(image_set[image_main_number])")
        image_next.image = UIImage(named: "\(image_set[image_next_number])")
        image_back.image = UIImage(named: "\(image_set[image_back_number])")
    }
    
    func image_next_func(){
        image_back_number = image_main_number
        image_main_number = image_next_number
        if (image_next_number >= image_max_count){
            image_next_number = 0
        }else{
            image_next_number += 1
        }
    }
    
    func image_back_func(){
        image_next_number = image_main_number
        image_main_number = image_back_number
        if (image_back_number <= 0){
            image_back_number = image_max_count
        }else{
            image_back_number -= 1
        }
    }
    
    func button_swich(flug:String){
        if(flug == "on"){
            button_next.isEnabled = true
            button_next.isHidden = false
            button_back.isEnabled = true
            button_back.isHidden = false
        }else{
            button_next.isEnabled = false
            button_next.isHidden = true
            button_back.isEnabled = false
            button_back.isHidden = true
        }
        
    }
    
    func auto_cancle(){
        button_swich(flug :"on")
        button_auto_stop.setTitle("\(moji_set[0])", for: UIControl.State())
        self.timer.invalidate()
        self.timer_sec = 0
        self.timer = nil
    }
    
    func button_moji_setup(){
        button_auto_stop.setTitle("\(moji_set[0])", for: UIControl.State())
        button_next.setTitle("\(moji_set[2])", for: UIControl.State())
        button_back.setTitle("\(moji_set[3])", for: UIControl.State())
        button_goto_big_main.setTitle("\(moji_set[4])", for: UIControl.State())
        button_goto_big_next.setTitle("\(moji_set[4])", for: UIControl.State())
        button_goto_big_back.setTitle("\(moji_set[4])", for: UIControl.State())
    }
    
}


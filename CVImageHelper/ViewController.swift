//
//  ViewController.swift
//  CVImageHelper
//
//  Created by caven on 2018/10/16.
//  Copyright © 2018 com.caven. All rights reserved.
//

import UIKit

let left: CGFloat = 20
let width: CGFloat = UIScreen.main.bounds.width - 40
let height_label: CGFloat = 30
let size_image: CGSize = CGSize(width: width, height: 100)
class ViewController: UIViewController {

    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
        self.scrollView.backgroundColor = UIColor.brown
        self.view.addSubview(self.scrollView)
        
        // 1. 使用颜色创建image
        let label1 = self.createLabel(text: "1. 使用颜色创建image")
        label1.frame = CGRect(x: left, y: 50, width: width, height: height_label)
        
        let imageView1 = UIImageView(frame: CGRect(x: left, y: label1.frame.maxY, width: width, height: 100))
        imageView1.image = UIImage(color: UIColor.orange, size: size_image)
        self.scrollView.addSubview(imageView1)
        
        // 2. 使用颜色创建渐变image
        let label2 = self.createLabel(text: "2. 使用颜色创建渐变image")
        label2.frame = CGRect(x: left, y: imageView1.frame.maxY + 20, width: width, height: height_label)
        
        let imageView2 = UIImageView(frame: CGRect(x: left, y: label2.frame.maxY, width: width, height: 100))
        
        imageView2.image = UIImage.init(gradientColors: [UIColor.orange, UIColor.red], size: size_image)
        self.scrollView.addSubview(imageView2)
        
        // 3. 给现有图片加上一个渐变的遮层
        let label3 = self.createLabel(text: "3. 给现有图片加上一个渐变的遮层")
        label3.frame = CGRect(x: left, y: imageView2.frame.maxY + 20, width: width, height: height_label)
        
        let imageView3 = UIImageView(frame: CGRect(x: left, y: label3.frame.maxY, width: 96, height: 72))
        imageView3.image = UIImage(named: "beach")
        
        let label3_1 = self.createLabel(text: "改变后：")
        label3_1.frame = CGRect(x: imageView3.frame.maxX + 20, y: label3.frame.maxY, width: 60, height: 72)
        
        let imageView3_1 = UIImageView(frame: CGRect(x: label3_1.frame.maxX + 20, y: label3.frame.maxY, width: 96, height: 72))
        imageView3_1.image = UIImage(named: "beach")?.apply(gradientColors: [UIColor.orange, UIColor.red])
        self.scrollView.addSubview(imageView3)
        self.scrollView.addSubview(imageView3_1)
        
        // 4. 使用view创建一个image
        let label4 = self.createLabel(text: "4. 使用view创建一个image")
        label4.frame = CGRect(x: left, y: imageView3.frame.maxY + 20, width: width, height: height_label)
        
        let label4_1 = self.createLabel(text: "hangge")
        label4_1.frame = CGRect(x: left, y: label4.frame.maxY, width: 96, height: 72)
        
        let label4_2 = self.createLabel(text: "改变后：")
        label4_2.frame = CGRect(x: label4_1.frame.maxX + 20, y: label4.frame.maxY, width: 60, height: 72)
        
        let imageView4 = UIImageView(frame: CGRect(x: label4_2.frame.maxX + 20, y: label4.frame.maxY, width: 96, height: 72))
        imageView4.image = UIImage(text: "hangge", size: CGSize(width: 96, height: 72))
        self.scrollView.addSubview(imageView4)
        
        // 5. 创建放射性的image
        let label5 = self.createLabel(text: "5. 创建放射性的image")
        label5.frame = CGRect(x: left, y: imageView4.frame.maxY + 20, width: width, height: height_label)
        
        let imageView5 = UIImageView(frame: CGRect(x: left, y: label5.frame.maxY, width: width, height: 100))
        
        imageView5.image = UIImage(startColor: UIColor.orange, endColor: UIColor.red, size: CGSize(width: width, height: 100))
        self.scrollView.addSubview(imageView5)
        
        // 6. 给图片添加外边距
        let label6 = self.createLabel(text: "6. 给图片添加外边距")
        label6.frame = CGRect(x: left, y: imageView5.frame.maxY + 20, width: width, height: height_label)
        
        let imageView6 = UIImageView(frame: CGRect(x: left, y: label6.frame.maxY, width: 96, height: 72))
        imageView6.backgroundColor = UIColor.orange
        imageView6.image = UIImage(named: "beach")?.apply(padding: 100)
        self.scrollView.addSubview(imageView6)
        
        // 7. 给图片添加圆角
        let label7 = self.createLabel(text: "7. 给图片添加圆角")
        label7.frame = CGRect(x: left, y: imageView6.frame.maxY + 20, width: width, height: height_label)
        
        let imageView7 = UIImageView(frame: CGRect(x: left, y: label7.frame.maxY, width: 96, height: 72))
        imageView7.image = UIImage(named: "beach")?.corners(radius: 100)
        self.scrollView.addSubview(imageView7)
        
        // 8. 给图片切成 圆形 + 边框
        let label8 = self.createLabel(text: "8. 给图片切成 圆形 + 边框")
        label8.frame = CGRect(x: left, y: imageView7.frame.maxY + 20, width: width, height: height_label)
        
        let imageView8_1 = UIImageView(frame: CGRect(x: left, y: label8.frame.maxY, width: 96, height: 72))
        imageView8_1.contentMode = .scaleAspectFit
        imageView8_1.image = UIImage(named: "beach")?.cornersToCircle()
        self.scrollView.addSubview(imageView8_1)
        
        let imageView8_2 = UIImageView(frame: CGRect(x: imageView8_1.frame.maxX + left, y: label8.frame.maxY, width: 96, height: 72))
        imageView8_2.contentMode = .scaleAspectFit
        imageView8_2.image = UIImage(named: "beach")?.cornersToCircle(withBorder: 60, color: UIColor.init(white: 1, alpha: 0.2))
        self.scrollView.addSubview(imageView8_2)
        
        // 9. 给图片添加效果：模糊层
        let label9 = self.createLabel(text: "9. 给图片添加效果：模糊层")
        label9.frame = CGRect(x: left, y: imageView8_2.frame.maxY + 20, width: width, height: height_label)
        
        let imageView9_1 = UIImageView(frame: CGRect(x: left, y: label9.frame.maxY, width: 96, height: 72))
        imageView9_1.contentMode = .scaleAspectFit
        imageView9_1.image = UIImage(named: "beach")?.applyLightEffect()
        self.scrollView.addSubview(imageView9_1)
        
        let imageView9_2 = UIImageView(frame: CGRect(x: imageView8_1.frame.maxX + left, y: label9.frame.maxY, width: 96, height: 72))
        imageView9_2.contentMode = .scaleAspectFit
        imageView9_2.image = UIImage(named: "beach")?.applyDarkEffect()
        self.scrollView.addSubview(imageView9_2)
        
        // 10. 给图片添加效果：模糊层
        let label10 = self.createLabel(text: "10. 给图片添加效果：模糊层")
        label10.frame = CGRect(x: left, y: imageView9_2.frame.maxY + 20, width: width, height: height_label)
        
        let imageView10_1 = UIImageView(frame: CGRect(x: left, y: label10.frame.maxY, width: 96, height: 72))
        imageView10_1.contentMode = .scaleAspectFit
        imageView10_1.image = UIImage(named: "beach")?.applyBlur(withRadius: 10, tintColor: UIColor(white: 1.0, alpha: 0.3), saturationDeltaFactor: 1.8)
        self.scrollView.addSubview(imageView10_1)
    }

    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        self.scrollView.addSubview(label)
        return label
    }
    
    
    
    // MARK: 截图
}


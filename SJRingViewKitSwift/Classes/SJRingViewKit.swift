//
//  SJRingViewKit.swift
//  Pods
//
//  Created by SoulJa on 2017/8/21.
//
//

import UIKit
import CoreGraphics

public class SJRingViewKit: UIView {
    //边框宽度
    var ringWidth:Float = 0.0
    //进度
    var progress:Double = 0.0
    //边框颜色
    var ringColor:UIColor = UIColor.clear
    
    //MARK:便利构建方法
    public convenience init(ringWidth:Float, ringColor:UIColor) {
        self.init(frame: CGRect())
        self.ringWidth = ringWidth
        self.ringColor = ringColor
        self.backgroundColor = UIColor.clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //MARK:绘制
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        //获取图形上下文
        let context:CGContext = UIGraphicsGetCurrentContext()!
        //设置圆心
        let center:CGPoint = CGPoint(x: rect.size.width/2, y: rect.size.height/2)
        //设置半径
        let radius = Float(rect.size.width / 2)  - ringWidth
        //起点
        let startA = -Double.pi/2
        //终点
        let endA = -Double.pi/2 + Double.pi * 2 * progress;
        //贝塞尔曲线
        let path:UIBezierPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        //设置线宽
        context.setLineWidth(CGFloat(ringWidth))
        //设置线的颜色
        context.setStrokeColor(ringColor.cgColor)
        //路径
        context.addPath(path.cgPath)
        //渲染路径
        context.strokePath()
    }
    
    //绘制圆环
    public func drawRing(progress:Double) {
        if (progress < 0 || progress > 1) {
            //移除圆环
            for subview in self.subviews {
                subview.removeFromSuperview()
            }
            return
        }
        self.progress = progress
        self.setNeedsDisplay()
    }
}

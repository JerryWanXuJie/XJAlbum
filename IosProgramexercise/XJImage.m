//
//  XJimageView.m
//  IosProgramexercise
//
//  Created by 万旭杰 on 15/8/29.
//  Copyright (c) 2015年 万旭杰. All rights reserved.
//

#import "XJImage.h"

@implementation XJImage

// 适配image的长宽比例

+(id)shareImageView
{
    XJImage * img =  [[XJImage alloc] init];
    return img;
}

// 适配Rect
-(CGRect)setFixImageViewSizeFrame:(CGRect)frame Image:(UIImage*)image BaseType :(XJimageViewBaseType)type
{
    if (image) {
        CGFloat imgwidth = image.size.width;
        CGFloat imgheight = image.size.height;
        CGFloat Scale = imgwidth / imgheight;
        CGFloat imgviewwidth = frame.size.width;
        CGFloat imgviewheight = frame.size.height;
        CGFloat realheight = imgviewwidth / Scale;
        CGFloat realwidth = imgviewheight * Scale;
        switch (type) {
            case XJimageViewBaseWidth:
            {
                // Width 一定  改变Height
                if (realheight>imgviewheight) {
                    //缩小
                    CGFloat differheight = realheight - imgviewheight;
                    CGFloat differwidth  = differheight * Scale;
                    return CGRectMake(frame.origin.x+differwidth/2, frame.origin.y, realwidth, imgviewheight);
                }
                return  CGRectMake(frame.origin.x, frame.origin.y, imgviewwidth, realheight);
            }
                break;
            case XJimageViewBaseHeight:
            {
                // Height 一定  改变 Width
                if (realwidth > imgviewwidth) {
                    //缩小
                    CGFloat differwidth = realwidth - imgviewwidth;
                    CGFloat differheight = differwidth / Scale;
                    return CGRectMake(frame.origin.x, frame.origin.y + differheight/2, imgviewwidth, realheight);
                }
                return  CGRectMake(frame.origin.x, frame.origin.y, realwidth, imgviewheight);
            }
            default:
                break;
        }
    }
    return CGRectNull;
}

// 旋转Image
-(UIImage*)setRotationImage :(UIImage*)image rotationSystemType :(UIImageOrientation)orientation
{
    CGFloat rotate = 0.0;
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGFloat scaleX = 1.0;
    CGFloat scaleY = 1.0;
    CGFloat translateX = 0;
    CGFloat translateY = 0;
    switch (orientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            scaleX = rect.size.height / rect.size.width;
            scaleY = rect.size.width / rect.size.height;
            translateX = 0;
            translateY = - rect.size.width;
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            rotate = 3*M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            scaleX = rect.size.height / rect.size.width;
            scaleY = rect.size.width / rect.size.height;
            translateX = - rect.size.height;
            translateY = 0;
            break;
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            translateX = 0;
            translateY = 0;
        default:
            break;
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context,translateX, translateY);
    CGContextScaleCTM(context, scaleX, scaleY);
    
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width,rect.size.height),image.CGImage);
    UIImage * newImg = UIGraphicsGetImageFromCurrentImageContext();
    return newImg;
}

//动画 淡入淡出

//加载框

@end

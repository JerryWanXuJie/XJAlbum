//
//  XJimageView.h
//  IosProgramexercise
//
//  Created by 万旭杰 on 15/8/29.
//  Copyright (c) 2015年 万旭杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    XJimageViewBaseHeight=1,
    XJimageViewBaseWidth,
}XJimageViewBaseType;

@interface XJImage : UIImage
+(id)shareImageView;
// 适配 image图片 的比例
-(CGRect)setFixImageViewSizeFrame:(CGRect)frame Image:(UIImage*)image BaseType :(XJimageViewBaseType)type;
-(UIImage*)setRotationImage :(UIImage*)image rotationSystemType :(UIImageOrientation)orientation;
@end

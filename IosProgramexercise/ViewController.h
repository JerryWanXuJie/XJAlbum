//
//  ViewController.h
//  IosProgramexercise
//
//  Created by 万旭杰 on 15/8/15.
//  Copyright (c) 2015年 万旭杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "XJimage.h"
typedef  NS_ENUM(NSInteger,MyClass)
{
    MyClassE = 0,
    MyClassS,
    MyClassG,
};

@interface ViewController : UIViewController


@end

@interface NSString (Wanxujie)

@property(nonatomic ,strong) NSArray * myarray;

@end

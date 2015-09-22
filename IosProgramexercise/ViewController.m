//
//  ViewController.m
//  IosProgramexercise
//
//  Created by 万旭杰 on 15/8/15.
//  Copyright (c) 2015年 万旭杰. All rights reserved.
//

#import "ViewController.h"
#import "XJAlbum.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end


@implementation ViewController
{
    XJAlbum * album;
    UIImageView * imgview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight/3, screenWidth, screenHeight/3)];
    [self.view addSubview:imgview];
    imgview.backgroundColor = [UIColor orangeColor];
    // 封装一个对 imageview 的方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(album)];
    imgview.userInteractionEnabled = YES;
    [imgview addGestureRecognizer:tap];
}

-(void)album
{
    NSArray *netarr = @[
                        @"http://www.sc.xinhuanet.com/content/2015-08/31/1116422810_14409889288491n.jpg"];
    album = [[XJAlbum alloc]initWithImgUrlArr:netarr CurPage:0];
    album.photoFrame = imgview.frame;
    [self.navigationController presentViewController:album animated:YES completion:nil];
}

@end

//
//  XJAlbum.h
//  IosProgramexercise
//
//  Created by 万旭杰 on 15/8/31.
//  Copyright (c) 2015年 万旭杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"
typedef enum
{
    XJAlbumOutImgViewPointLeftUp =1,
    XJAlbumOutImgViewPointRightUp,
    XJAlbumOutImgViewPointLeftDown,
    XJAlbumOutImgViewPointRightDown
}XJAlbumOutImgViewPointType;

#define myScreenHeight  [UIScreen mainScreen].bounds.size.height
#define myScreenWidth   [UIScreen mainScreen].bounds.size.width

@protocol XJAlbumDelegate <NSObject>

- (void)getCurPage:(NSInteger)curPage;

@end

@interface XJAlbum :UIViewController<UIScrollViewDelegate>
@property (nonatomic,assign)CGRect photoFrame;
@property (nonatomic,strong)id<XJAlbumDelegate>myDelegate;
-(id)initWithImgUrlArr:(NSArray*)array CurPage:(NSInteger)curpage;
-(id)initWithImgULocationArr:(NSArray*)array CurPage:(NSInteger)curpage;
@end

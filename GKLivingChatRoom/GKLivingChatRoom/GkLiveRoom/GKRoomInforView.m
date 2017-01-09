//
//  GKRoomInforView.m
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/9.
//  Copyright © 2017年 郭凯. All rights reserved.
//

#import "GKRoomInforView.h"

@implementation GKRoomInforView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.02];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, self.bounds.size.width-40, 300)];
        label.numberOfLines = 0;
        label.textColor = [UIColor whiteColor];
        label.center = self.center;
        label.text = @"此页面用来展示主播的信息,礼物展示,在线展示,聊天内容展示....\n 大家根据自己的项目需要在此视图上面布局";
        [self addSubview:label];
    }
    return self;
}

@end

//
//  GKRoomScrollView.h
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/9.
//  Copyright © 2017年 郭凯. All rights reserved.
//  此类主要实现了在当前视图上面添加了一个scrollerview用来上线切换房间,大家不用担心循环引用的问题,在此类已经解决了循环引用

#import <UIKit/UIKit.h>

@interface GKRoomScrollView :UIView
-(instancetype)init NS_UNAVAILABLE;

/**
 传入房间数据数组,目前我只传入的是图片数组,
 在项目开发中,我们需要传入我们的模型数组,
 主要是为此对象传入图片链接,生成磨玻璃图片
 */
@property (nonatomic,strong) NSArray* roomDatas;

/**
   此参数主要决定了用户当前选折的房间在我们请求到的数组中所在的位置 
 */
@property (nonatomic,assign) NSInteger index;
@end

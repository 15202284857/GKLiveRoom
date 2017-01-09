//
//  GKLiveRoomController.m
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/6.
//  Copyright © 2017年 郭凯. All rights reserved.
//  主播播放控制器  关联整个直播页面的业务逻辑 目前当前控制器主要有 GKRoomScrollView 


#import "GKLiveRoomController.h"
#import "GKRoomScrollView.h"

@interface GKLiveRoomController ()<UIScrollViewDelegate>
/**所有视图*/
@property (nonatomic,strong) NSMutableArray* subViews;
/**正在显示的视图*/
@property (nonatomic,strong) UIView* showView;
/**房间滚动视图*/
@property (nonatomic,strong) GKRoomScrollView* roomScrollView;

@end

@implementation GKLiveRoomController

-(NSArray *)roomDatas{
    if (!_roomDatas) {
        _roomDatas = @[@"IMG_0.PNG",@"IMG_1.PNG",@"IMG_2.PNG"];
    }
    return _roomDatas;
}

-(GKRoomScrollView *)roomScrollView{
    if (!_roomScrollView) {
        _roomScrollView = [[GKRoomScrollView alloc]initWithFrame:self.view.bounds];
    }
    return _roomScrollView;
}
-(NSMutableArray *)subViews{
    if (!_subViews) {
        _subViews = [NSMutableArray arrayWithCapacity:3];
    }
    return _subViews;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setUpRoomScollView];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

// 设置roomScrollView
-(void)setUpRoomScollView{
    [self.view addSubview:self.roomScrollView];
    self.roomScrollView.index = 1;  //重要 必须先传入索引值
    self.roomScrollView.roomDatas = self.roomDatas;

}

@end

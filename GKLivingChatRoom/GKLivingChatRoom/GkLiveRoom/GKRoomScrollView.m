//
//  GKRoomScrollView.m
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/9.
//  Copyright © 2017年 郭凯. All rights reserved.
// 

#define SCREENWIDTH  self.bounds.size.width
#define SCREENHEIGHT self.bounds.size.height

#import "GKRoomScrollView.h"
#import "GKRoomShowView.h"

@interface GKRoomScrollView()<UIScrollViewDelegate>
/**所有视图*/
@property (nonatomic,strong) NSMutableArray* subViews;
/**正在显示的视图*/
@property (nonatomic,strong) UIView* showView;
/**房间展示视图*/
@property (nonatomic,strong) GKRoomShowView* roomShowView;
@end

@implementation GKRoomScrollView

-(GKRoomShowView *)roomShowView{
    if (!_roomShowView) {
        _roomShowView = [[GKRoomShowView alloc]initWithFrame:self.bounds];
    }
    return _roomShowView;
}

-(NSMutableArray *)subViews{
    if (!_subViews) {
        _subViews = [NSMutableArray arrayWithCapacity:3];
    }
    return _subViews;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIScrollView *scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        scrollerView.delegate = self;
        scrollerView.bounces = NO;
        scrollerView.pagingEnabled = YES;
        [self addSubview:scrollerView];
        
        for (NSInteger i = 0; i < 3; i ++ ){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
            [self generateDimImage:imageView];
            CGFloat imageY = CGRectGetHeight(self.bounds)*i;
            imageView.frame = CGRectMake(0, imageY, SCREENWIDTH, SCREENHEIGHT);
            [scrollerView addSubview:imageView];
            [self.subViews addObject:imageView];
        }
        scrollerView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT*3);
        scrollerView.contentOffset = CGPointMake(0, SCREENHEIGHT);
    }
    return self;
}


-(void)setRoomDatas:(NSArray *)roomDatas{
    _roomDatas = roomDatas;
    [self setUpImageWith:self.index];
}


// 设置当前图片根据当前的索引
-(void)setUpImageWith:(NSInteger )index{
    for (NSInteger i = 0; i < self.subViews.count; i ++) {
        UIImageView *imageView = self.subViews[i];
        imageView.userInteractionEnabled = YES;
        NSInteger currentIndex;
        if (i==0) {
            currentIndex = index==0 ? self.roomDatas.count-1 : index -1;
  
        }else if (i==1){
            currentIndex = index;
            
        }else{
            currentIndex = index==self.roomDatas.count-1 ? 0 : index + 1;
        }
        /**此处非常重要 可以根据自己是实际需要选折是显示本地照片或者网路照片,若显示网路照片,请将下面的方法换成sdwebimage显示图片方法*/
        imageView.image = [UIImage imageNamed:self.roomDatas[currentIndex]];
    }
    
    //主需要将播放视图展示在i==1的界面即可
    UIView *currentView = self.subViews[1];
    [currentView addSubview:self.roomShowView];
}

#pragma mark UIScrollViewDelegate 此处解决了scrollerview的循环引用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index  = scrollView.contentOffset.y/SCREENHEIGHT;
    if (index==1) return;

    for (NSInteger i = 0; i < self.subViews.count; i ++ ) {
        UIView *subView = self.subViews[i];
        if (index == i) {
            self.showView = subView;
            continue;
        }
        [subView removeFromSuperview];
    }
    [self.subViews removeAllObjects];
    self.index = scrollView.contentOffset.y/SCREENHEIGHT <1 ? --self.index :++self.index;
    if (self.index<0) {
        self.index = self.roomDatas.count - 1;
    }else if (self.index>=self.roomDatas.count){
        self.index = 0;
    }
    for (NSInteger i = 0; i < 3; i ++ ) {
        if (i == 1) {
            self.showView.frame =  CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT);
            [self.subViews addObject: self.showView];
            continue;
        }
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self generateDimImage:imageView];
        CGFloat imageY = CGRectGetHeight(self.bounds)*i;
        imageView.frame = CGRectMake(0, imageY, SCREENWIDTH, SCREENHEIGHT);
        [scrollView addSubview:imageView];
        [self.subViews addObject:imageView];
    }
    scrollView.contentOffset = CGPointMake(0, SCREENHEIGHT);
    [self setUpImageWith:self.index];
}


// 生成磨玻璃图片
-(void)generateDimImage:(UIImageView *)imageView{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    [imageView addSubview:effectView];
}

@end

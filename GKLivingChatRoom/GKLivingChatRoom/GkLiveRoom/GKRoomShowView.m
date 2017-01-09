//
//  GKRoomShowView.m
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/9.
//  Copyright © 2017年 郭凯. All rights reserved.
//
#define SCREENWIDTH  self.bounds.size.width
#define SCREENHEIGHT self.bounds.size.height

#import "GKRoomShowView.h"
#import "GKRoomInforView.h"

@interface GKRoomShowView()<UICollectionViewDataSource,UICollectionViewDelegate>
/**主播的信息 礼物 聊天内容展示界面*/
@property(nonatomic,strong)GKRoomInforView *inforView;
@end

@implementation GKRoomShowView

-(GKRoomInforView *)inforView{
    if (!_inforView) {
        _inforView = [[GKRoomInforView alloc]initWithFrame:self.bounds];
    }
    return _inforView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.itemSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GKRoomShowView"];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [self addSubview:collectionView];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GKRoomShowView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row==1) {
        [cell.contentView addSubview:self.inforView];
    }

    return cell;
}

@end

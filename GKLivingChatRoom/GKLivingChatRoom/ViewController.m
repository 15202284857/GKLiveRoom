//
//  ViewController.m
//  GKLivingChatRoom
//
//  Created by Apple on 17/1/6.
//  Copyright © 2017年 郭凯. All rights reserved.
//

#import "ViewController.h"
#import "GKLiveRoomController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gotonext:(id)sender {
    GKLiveRoomController *roomVc = [[GKLiveRoomController alloc]init];
    [self.navigationController pushViewController:roomVc animated:YES];
}


@end

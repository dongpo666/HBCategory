//
//  ViewController.m
//  HBCategoryDemo
//
//  Created by 东坡 on 2021/4/14.
//  Copyright © 2021 东坡. All rights reserved.
//

#import "ViewController.h"
#import "HBKitCategory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *bt = [UIButton hb_buttonCustomButtonWithFrame:CGRectMake(10, 80, 100, 30) title:@"你好" titleFont:[UIFont systemFontOfSize:16] backgroundColor:[UIColor clearColor] titleColor:[UIColor blackColor] tapAction:^(UIButton *button) {
        
    }];
    [self.view addSubview:bt];
}


@end

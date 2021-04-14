//
//  UIViewController+Dealloc.h
//  RuntimeDemo
//
//  Created by LeeJay on 16/8/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//  代码下载地址https://github.com/leejayID/Linkage

#import <UIKit/UIKit.h>

@interface UIViewController (Dealloc)
@property(nonatomic, assign) BOOL hidesNavigationBarWhenPushed; // If YES, then when this view controller is pushed into a controller hierarchy with a navigation bar, the navigation bar will slide out. Default is NO.

@end

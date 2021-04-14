//
//  UIViewController+Dealloc.m
//  RuntimeDemo
//
//  Created by LeeJay on 16/8/8.
//  Copyright © 2016年 LeeJay. All rights reserved.
//  代码下载地址https://github.com/leejayID/Linkage

#import "UIViewController+Dealloc.h"
#import <objc/runtime.h>

@implementation UIViewController (Dealloc)
static const void *_hidesNavigationBarWhenPushed = &_hidesNavigationBarWhenPushed;

- (void)setHidesNavigationBarWhenPushed:(BOOL)hidesNavigationBarWhenPushed {
    objc_setAssociatedObject(self, _hidesNavigationBarWhenPushed, @(hidesNavigationBarWhenPushed), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)hidesNavigationBarWhenPushed {
    return [objc_getAssociatedObject(self, _hidesNavigationBarWhenPushed) boolValue];
}
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        Method method2 = class_getInstanceMethod(self, @selector(my_dealloc));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)my_dealloc
{
    NSLog(@"%@销毁了", self);
    [self my_dealloc];
}

@end

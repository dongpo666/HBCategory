#import "UIButton+HBExtension.h"
#import "UIView+Extension.h"
#pragma mark - 内部类 HBExButton
@interface HBButton : UIButton
@property (nonatomic,copy) TapButtonActionBlock action;
@end


@implementation HBButton
- (instancetype)init{
    if(self = [super init]){
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    }
    return self;
}
-(void)btnClick:(UIButton *)button{
    if(self.action){
        button.enabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            button.enabled = YES;
        });
        
        self.action(self);
    }
}
@end


@implementation UIButton (HBExtension)

#pragma mark - 实现方法


+ (instancetype)hb_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                                     titleFont:(UIFont*)font
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                                     tapAction:(TapButtonActionBlock)tapAction{
    HBButton *btn = [HBButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
//    btn.clipsToBounds = YES;
    btn.action = tapAction;
    return btn;
    
}


+(instancetype)hb_buttonSystemButtonWithFrame:(CGRect)frame NormalBackgroundImageString:(NSString *)imageString tapAction:(TapButtonActionBlock)tapAction{
    HBButton *btn = [HBButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    btn.action = tapAction;
    return btn;
    
}
+(instancetype)hb_buttonSystemButtonImageNamed:(NSString *)imageString tapAction:(TapButtonActionBlock)tapAction{
    HBButton *btn = [HBButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageString];
    btn.width = image.size.width;
    btn.height = image.size.height;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateHighlighted];
    btn.action = tapAction;
    btn.userInteractionEnabled = YES;
    return btn;
    
}
+ (instancetype)hb_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                                     titleFont:(UIFont*)font
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                   bezierPathByRoundingCorners:(UIRectCorner)rectCorner
                                   cornerRadii:(CGSize)cornerRadii
                                     tapAction:(TapButtonActionBlock)tapAction{
    
    HBButton *btn = [HBButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.action = tapAction;
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    btn.layer.mask = maskLayer;
    
    return btn;
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}


@end

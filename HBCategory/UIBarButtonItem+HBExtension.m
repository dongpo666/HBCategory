#import "UIBarButtonItem+HBExtension.h"

#pragma mark - 内部类 HBExButton
@interface HBExButton : UIButton
@property (nonatomic,copy) dispatch_block_t action;
@end

@implementation HBExButton

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
        self.action();
    }
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

@implementation UIBarButtonItem (HBExtension)
#pragma mark - 分类 HBExButton

+ (instancetype)hb_barButtonItemTitleWithFrame:(CGRect )frame
                                         title:(NSString *)title
                                    titleColor:(UIColor *)titleColor
                                          font:(UIFont *)font
                                     tapAction:(dispatch_block_t)tapAction{
    HBExButton *btn = [HBExButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.action = tapAction;
    btn.titleLabel.font = font;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;


}
+ (instancetype)hb_barButtonItemImageWithFrame:(CGRect )frame
                                         image:(NSString *)image
                                     tapAction:(dispatch_block_t)tapAction{
    
    HBExButton *btn = [HBExButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.action = tapAction;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
    
}

@end

#import "UIImageView+HBExtension.h"
#import "UIView+Extension.h"
#pragma mark 内部类 BMExImageView
@interface HBExImageView : UIImageView
@property (nonatomic,copy) void (^action)(UIImageView *image);

@end

@implementation HBExImageView
- (instancetype)init{
    if (self = [super init]) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}
- (void)tapImageBtnClick{
    if (self.action) {
        self.action(self);
    }
}
@end

@implementation UIImageView (HBExtension)
+ (instancetype)hb_imageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr{
    UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
    image.image = [UIImage imageNamed:imageStr];
    image.backgroundColor = [UIColor clearColor];
    image.userInteractionEnabled = YES;
//    image.width = image.image.size.width;
//    image.height = image.image.size.height;
    return image;
}

+(instancetype)hb_imageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr
                            tapAction:(void(^)(UIImageView *image))tapAction{
    HBExImageView *image = [[HBExImageView alloc] initWithFrame:frame];
    image.userInteractionEnabled = YES;
    image.image = [UIImage imageNamed:imageStr];
    image.clipsToBounds = YES;
    image.action = tapAction;
    image.backgroundColor = [UIColor clearColor];
    return image;
}


+ (instancetype)hb_imageViewWithFrame:(CGRect)frame
                          imageName:(NSString *)imageStr
                       cornerRadius:(CGFloat)cornerRadius
                        borderColor:(UIColor *)borderColor
                        borderWidth:(CGFloat)borderWidth
                        tapAction:(void(^)(UIImageView *image))tapAction{
    HBExImageView *image = [[HBExImageView alloc] initWithFrame:frame];
    image.userInteractionEnabled = YES;
    image.image = [UIImage imageNamed:imageStr];
    image.clipsToBounds = YES;
    image.layer.cornerRadius = cornerRadius;
    image.layer.borderColor = borderColor.CGColor;
    image.layer.borderWidth = borderWidth;
    image.action = tapAction;
    image.backgroundColor = [UIColor clearColor];

    return image;
}
+ (instancetype)hb_imageViewWithImageName:(NSString *)imageStr tapAction:(void(^)(UIImageView *image))tapAction{
    HBExImageView *image = [HBExImageView new];
    UIImage *im = [UIImage imageNamed:imageStr];
    image.width = im.size.width;
    image.height = im.size.height;
    image.image = im;
    image.backgroundColor = [UIColor clearColor];
    image.userInteractionEnabled = YES;
    image.action = tapAction;
    
    return image;
}




@end

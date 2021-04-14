

#import "UIColor+HBCategory.h"
#define mRGBToColor(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

#define kColorSeparatorLine  mRGBToColor(0xF5F5F5)  ///<分割线
#define kColorBackground       mRGBToColor(0xF5F5F5) ///<背景色

#define kTextColorHeadline     mRGBToColor(0x171717) ///<导航栏、标题栏
#define kTextColorTitle    mRGBToColor(0x333333) ///<主标题
#define kTextColorSubhead      mRGBToColor(0x888888) ///<副标题


#define kColorLineDark   mRGBToColor(0x3C3C3C)///<暗黑色分割线
#define kTextColorTitleDark    mRGBToColor(0xF2F2F2) ///<暗黑主标题
#define kTextColorSubheadDark    mRGBToColor(0x98989D) ///<暗黑副标题
#define kColorBackgroundDark     mRGBToColor(0x2B2B2B) ///<暗黑分割背景颜色
#define kColorSecondDark       mRGBToColor(0x121212)///<暗黑下的第二背景色


@implementation UIColor (HBCategory)


+ (UIColor *)themeTitleColor{
    return [UIColor tab_getColorWithLightColor:kTextColorTitle darkColor:kTextColorTitleDark];
}
+ (UIColor *)subheadTitleColor{
    return [UIColor tab_getColorWithLightColor:kTextColorSubhead darkColor:kTextColorSubheadDark];
}

+ (UIColor *)secondBackgroundColor{
    return [UIColor tab_getColorWithLightColor:[UIColor whiteColor] darkColor:kTextColorTitle];
}

+ (UIColor *)listBackgroundColor{
    return [UIColor tab_getColorWithLightColor:kColorBackground darkColor:kColorSecondDark];
}
+ (UIColor *)lineColor{
    return [UIColor tab_getColorWithLightColor:kColorSeparatorLine darkColor:kColorLineDark];
}
+ (UIColor *)tab_getColorWithLightColor:(UIColor *)lightColor
                              darkColor:(UIColor * _Nullable)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            }else {
                return lightColor;
            }
        }];
    } else {
        return lightColor;
    }
}
+ (BOOL)isStyleDark{
    if (@available(iOS 13.0, *)) {
      return  UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    }
    return NO;
}
+ (UIColor *)tab_normalDynamicBackgroundColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor tab_getColorWithLightColor:UIColor.whiteColor
                                         darkColor:UIColor.systemBackgroundColor];
        
    }else {
        return [UIColor tab_getColorWithLightColor:UIColor.whiteColor
                                         darkColor:nil];
    }
}

+(UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)a:1.0];
}

+(UIColor *)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue a:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+(UIColor *)colorWithHex:(uint32_t)hex{
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    return [self colorWithRed:r green:g blue:b a:1.0];
}
+(UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha{
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    return [self colorWithRed:r green:g blue:b a:alpha];
}

+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(CGFloat)height
{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}
@end

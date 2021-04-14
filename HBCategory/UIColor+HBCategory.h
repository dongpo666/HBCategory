

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HBCategory)

+ (UIColor *)tab_normalDynamicBackgroundColor;

+ (UIColor *)tab_getColorWithLightColor:(UIColor *)lightColor
                              darkColor:(UIColor * _Nullable)darkColor;

/// 主题色颜色
+ (UIColor *)themeTitleColor;

/// 副标题颜色
+ (UIColor *)subheadTitleColor;

/// 控件背景颜色
+ (UIColor *)secondBackgroundColor;

/// 分割线颜色
+ (UIColor *)lineColor;


/// 列表背景颜色
+ (UIColor *)listBackgroundColor;

/// 随机色
+ (UIColor *)randomColor;

/// 使用16进制数字创建颜色
/// @param hex 0xFFFFFF
+ (UIColor *)colorWithHex:(uint32_t)hex;

/// 使用16进制数字创建颜色
/// @param hex 0xFFFFFF
/// @param alpha 透明度0.0-1.0
+(UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;
/**
*  @brief  渐变颜色
*
*  @param fromColor  开始颜色
*  @param toColor    结束颜色
*  @param height     渐变高度
*
*  @return 渐变颜色
*/
+ (UIColor*)gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;

/// RGB颜色
//+(UIColor *)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha;


/// 是否为暗黑模式
+ (BOOL)isStyleDark;

@end

NS_ASSUME_NONNULL_END

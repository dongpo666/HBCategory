#import <UIKit/UIKit.h>
typedef void(^TapButtonActionBlock) (UIButton *button);

@interface UIButton (HBExtension)

/**
 *  快速创建文字Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param font           font
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param tapAction       回调
 */
+ (instancetype)hb_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                                     titleFont:(UIFont*)font
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                                     tapAction:(TapButtonActionBlock)tapAction;



/**
 *   快速创建图片Button
 *
 *  @param frame       frame
 *  @param imageString 按钮的背景图片
 *  @param tapAction   回调
 */
+ (instancetype)hb_buttonSystemButtonWithFrame:(CGRect)frame
                   NormalBackgroundImageString:(NSString *)imageString
                                     tapAction:(TapButtonActionBlock)tapAction;

/**
 *  指定角切圆角
 *
 *  @param frame           frame
 *  @param title           title
 *  @param font           font
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param rectCorner      指定角UIRectCorner
 *  @param cornerRadii     圆角大小
 *  @param tapAction       回调
 */

+ (instancetype)hb_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                                     titleFont:(UIFont*)font
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                   bezierPathByRoundingCorners:(UIRectCorner)rectCorner
                                   cornerRadii:(CGSize)cornerRadii
                                     tapAction:(TapButtonActionBlock)tapAction;

/// 设置图片的button
/// @param imageString 图片名称
/// @param tapAction 点击效果
+(instancetype)hb_buttonSystemButtonImageNamed:(NSString *)imageString tapAction:(TapButtonActionBlock)tapAction;









@end

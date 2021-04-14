#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HBExtension)
/**
 *  创建一个文字  item
 *
 *  @param frame      frame
 *  @param title      文字
 *  @param titleColor 文字颜色
 *  @param tapAction  回调
 */
+ (instancetype)hb_barButtonItemTitleWithFrame:(CGRect )frame
                                         title:(NSString *)title
                                    titleColor:(UIColor *)titleColor
                                          font:(UIFont *)font
                                     tapAction:(dispatch_block_t)tapAction;
/**
 *  创建一个图片  item
 *
 *  @param frame      frame
 *  @param image      文字
 *  @param tapAction  回调
 */
+ (instancetype)hb_barButtonItemImageWithFrame:(CGRect )frame
                                         image:(NSString *)image
                                     tapAction:(dispatch_block_t)tapAction;
@end

#import <UIKit/UIKit.h>
@interface UIImageView (HBExtension)

/**
 *  创建 UIImageView
 *
 *  @param frame    尺寸
 *  @param imageStr 图片名字(图片在项目中)
 */
+ (instancetype)hb_imageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr;

/**
 *  创建 UIImageView
 *
 *  @param frame     尺寸
 *  @param imageStr  图片名字(图片在项目中)
 *  @param tapAction 单击回调
 */
+ (instancetype)hb_imageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr
                            tapAction: ( void(^)(UIImageView *image))tapAction;



/**
 *  切圆角
 *
 *  @param frame        CGRect
 *  @param imageStr    NSString
 *  @param cornerRadius CGFloat
 *  @param borderColor  UIColor
 *  @param borderWidth  CGFloat
 *  @param tapAction 单击回调
 *  @return UIImageView
 */
+ (instancetype)hb_imageViewWithFrame:(CGRect)frame
                            imageName:(NSString *)imageStr
                         cornerRadius:(CGFloat)cornerRadius
                          borderColor:(UIColor *)borderColor
                          borderWidth:(CGFloat)borderWidth
                            tapAction:(void(^)(UIImageView *image))tapAction;

/**
 按照图定宽高能点击

 @param imageStr 图片名称
 @param tapAction 点击回调
 @return UIImageView
 */
+ (instancetype)hb_imageViewWithImageName:(NSString *)imageStr tapAction:(void(^)(UIImageView *image))tapAction;

@end



#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, OptionStyle) {
    OptionStyleStyleOK_Cancel = 0,
    OptionStyleStyleOnlyOK
};

@interface UIAlertController (Alert)

/// 中间弹窗
/// @param title 标题
/// @param message 消息
/// @param optionStyle 弹窗选项样式，两个选择或只有一个
/// @param okTitle 右边选项的文字
/// @param cancelTitle 左边选项的文字
/// @param okColor 右边按钮文字颜色
/// @param cancelColor 左边按钮文字颜色
/// @param okBlock 右边选择选中后执行的代码
/// @param cancelBlock 左边选项选中后执行的代码
+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock;


/**
 从下面出现的弹窗
 
 @param title 标题
 @param message 消息
 @param optionStyle 弹窗选项样式，两个选择或只有一个
 @param okTitle 上面选项的文字
 @param cancelTitle 下面选项的文字
 @param okBlock 上面选择选中后执行的代码
 @param cancelBlock 下面选项选中后执行的代码
 @return UIAlertController
 */
+ (UIAlertController *)hb_sheetAlertControllerWithTitle:(NSString *)title
                                                message:(NSString *)message
                                            optionStyle:(OptionStyle)optionStyle
                                                OkTitle:(NSString *)okTitle
                                            cancelTitle:(NSString *)cancelTitle
                                                okBlock:(dispatch_block_t)okBlock
                                            cancelBlock:(dispatch_block_t)cancelBlock;

/// 从下面出现的弹框-多行
/// @param title 标题
/// @param message 副标题
/// @param cancelTitle 取消文字
/// @param titleArray 多行文字显示
/// @param okBlock 点击行
+ (UIAlertController *)hb_sheetAlertControllerWithTitle:(NSString *)title
                                                message:(NSString *)message
                                            cancelTitle:(NSString *)cancelTitle
                                             titleArray:(NSArray *)titleArray
                                                okBlock:(void (^)(NSInteger idx))okBlock;

/// 带输入框的alert
/// @param title 标题
/// @param message 副标题
/// @param optionStyle 弹窗选项样式，两个选择或只有一个
/// @param okTitle 确定选项的文字
/// @param cancelTitle 取消选项文字
/// @param okBlock 确定回调
/// @param cancelBlock 取消回调
/// @param placeholder 文本默认文字
/// @param okColor 右边按钮文字颜色
/// @param cancelColor 左边按钮文字颜色
/// @param secureTextEntry 默认明文


+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock
                                       placeholder:(NSString *)placeholder
                                   secureTextEntry:(BOOL)secureTextEntry;

/// 带两个输入框的alert
/// @param title 标题
/// @param message 副标题
/// @param optionStyle 弹窗选项样式，两个选择或只有一个
/// @param okTitle 确定选项的文字
/// @param cancelTitle 取消选项文字
/// @param okColor 确定选项的文字
/// @param cancelColor 取消选项文字
/// @param okBlock 确定回调
/// @param cancelBlock 取消回调
/// @param firstTextField 第一行textField
/// @param secondTextField 第二行textField
+ (UIAlertController *)hb_alertControllerWithTitle:(NSString *)title
                                           message:(NSString *)message
                                       optionStyle:(OptionStyle)optionStyle
                                           OkTitle:(NSString *)okTitle
                                       cancelTitle:(NSString *)cancelTitle
                                      OkTitleColor:(UIColor *)okColor
                                  cancelTitleColor:(UIColor *)cancelColor
                                           okBlock:(dispatch_block_t)okBlock
                                       cancelBlock:(dispatch_block_t)cancelBlock
                                    firstTextField:(UITextField *)firstTextField
                                   secondTextField:(UITextField *)secondTextField;

@end

/*
 *计算文本大小
 */
#import <UIKit/UIKit.h>
@interface UILabel (StringFrame)
- (CGSize)boundingRectWithSize:(CGSize)size;
/**
 设置行间距和行缩进
 
 @param text                设置文字
 @param alignment           alignment
 @param headIndent          行缩进
 @param firstLineHeadIndent 行首缩进
 @param lineSpacing         行间距
 */
-(void)setParagraphStyleWithText:(NSString *)text alignment:(NSTextAlignment)alignment headIndent:(CGFloat)headIndent firstLineHeadIndent:(CGFloat)firstLineHeadIndent lineSpacing:(CGFloat)lineSpacing;

@end

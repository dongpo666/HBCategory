#import "UILabel+StringFrame.h"

@implementation UILabel (StringFrame)
-(CGSize)boundingRectWithSize:(CGSize)size{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, self.textColor,NSForegroundColorAttributeName,nil];
    CGSize retSize = [self.text boundingRectWithSize:size
                                                 options:
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                              attributes:attributes
                                                 context:nil].size;
    return retSize;
}

-(void)setParagraphStyleWithText:(NSString *)text alignment:(NSTextAlignment)alignment headIndent:(CGFloat)headIndent firstLineHeadIndent:(CGFloat)firstLineHeadIndent lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentLeft;  //对齐
    //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    CGFloat emptylen = self.font.pointSize * headIndent;
    paraStyle.headIndent = emptylen;//行首缩进
    paraStyle.firstLineHeadIndent = firstLineHeadIndent;//首行缩进
    paraStyle.tailIndent = 0.0;//行尾缩进
    paraStyle.lineSpacing = lineSpacing;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName:paraStyle}];
    
    self.attributedText = attrText;
}

@end

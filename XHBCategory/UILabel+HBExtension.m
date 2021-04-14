#import "UILabel+HBExtension.h"

@implementation UILabel (HBExtension)
+ (instancetype)hb_labelWithFrame:(CGRect )frame
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                    textAlignment:(NSTextAlignment)textAlignment
                             font:(UIFont *)font{
    UILabel *label  = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = titleColor;
    label.textAlignment = textAlignment;
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    return label;
}



+ (UILabel *)hb_labelWithFrame:(CGRect)frame text:(NSString *)textStr textColor:(UIColor *)textColor textFont:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment valueColor:(UIColor *)valueColor rangeOfString:(NSString *)rangeStr{
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.frame = frame;
    titleLab.text = textStr;
    titleLab.textColor = textColor;
    titleLab.font = font;
    titleLab.textAlignment = textAlignment;
    titleLab.backgroundColor = [UIColor clearColor];
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:textStr];
    [attribute addAttribute:NSForegroundColorAttributeName value:valueColor range:[textStr rangeOfString:rangeStr]];
    titleLab.attributedText = attribute;
    return titleLab;
    
}
+ (instancetype)hb_labelWithFrame:(CGRect )frame
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                  backgroundColor:(UIColor *)backgroundColor
      bezierPathByRoundingCorners:(UIRectCorner)rectCorner
                      cornerRadii:(CGSize)cornerRadii
                    textAlignment:(NSTextAlignment)textAlignment
                             font:(UIFont *)font{
    UILabel *label  = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = titleColor;
    label.textAlignment = textAlignment;
    label.font = font;
    label.backgroundColor = backgroundColor;
    label.clipsToBounds = YES;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    label.layer.mask = maskLayer;
    return label;
    
}

/**
 *  设置label的行间距
 */
- (void)hb_lineSpaceWithSpacing:(CGFloat)spacing{
    NSMutableAttributedString *attributedString =
    [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    
    //调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}
@end

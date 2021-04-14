//
//  UINavigationBar+Extension.h
//  mixcloud
//
//  Created by 东坡 on 2020/10/28.
//  Copyright © 2020 Jovision. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Extension)
- (void)hh_setBackgroundColor:(UIColor *)backgroundColor;
- (void)hb_setElementsAlpha:(CGFloat)alpha;
- (void)hb_setTranslationY:(CGFloat)translationY;
- (void)hb_reset;
@end

NS_ASSUME_NONNULL_END

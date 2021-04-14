//
//  NSString+Replace.h
//  BeautifulHome
//
//  Created by 臧英振 on 16/8/14.
//  Copyright © 2016年 ZYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Replace)
//隐藏文字
+(NSString*)replacestr:(NSString*)BeforeReplacement range:(NSRange)range;
///是否是身份证号
+ (BOOL)validateIDCardNumber:(NSString *)value;

+ (BOOL)is18IdCard:(NSString*)value;
//是否是空字符串
- (BOOL)isEmpty;
//  是否是邮箱
- (BOOL)isEmail;
//是否是电话号
-(BOOL)isMobileNo;
//是否是中文
-(BOOL)isChinese;
// 是否是银行卡号 no不是银行卡
- (BOOL)isBankCard;
//是否是身份证号不准确 只判断了位数
- (BOOL)isIdentityCard;
//是否是微信号
-(BOOL)isWeiXin;
///是否是正常金额
- (BOOL)isMoeny;
//是否是数字（没有位数限制）
-(BOOL)isNumbers;
//是否是纯数字
-(BOOL)isVerification;
//是否输入的可以用
-(BOOL)issureInput;
//是否是包含特殊字符 yes不包含，no包含
-(BOOL)isSpecialCharacter;
//拼接post请求
- (NSString *)urlDictToStringWithWithDict:(NSDictionary *)parameters;
- (NSString *)urlWithPage:(int)page;
+(NSString *)transformHTML:(NSString *)html;
+ (NSString *)checkLongForMM_DD_HH_mm:(NSString *)longDate;
@end

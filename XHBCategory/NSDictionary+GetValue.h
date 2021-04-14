#import <Foundation/Foundation.h>

@interface NSDictionary (GetValue)
/**
 *  字符串转化
 *
 *  @param newKey NSString
 *
 *  @return NSString
 */
- (NSString *)getStringForKey:(NSString *)newKey;
/**
 *  Integer转化
 *
 *  @param newKey NSString
 *
 *  @return NSInteger
 */
- (NSInteger)getIntegerForKey:(NSString *)newKey;
/**
 *  NSNumber转化
 *
 *  @param newKey NSString
 *
 *  @return NSNumber
 */
- (NSNumber *)getCurrencyForKey:(NSString *)newKey;
@end

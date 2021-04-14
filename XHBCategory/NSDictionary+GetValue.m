#import "NSDictionary+GetValue.h"

@implementation NSDictionary (GetValue)

- (NSString *)getStringForKey:(NSString *)newKey{
    NSString *str = [self objectForKey:newKey];
    if (str && [str isKindOfClass:[NSString class]]) {
        return str;
    }
    if ([self objectForKey:newKey]) {
        NSString *intergerStr = [NSString stringWithFormat:@"%@", [self objectForKey:newKey]];
        if (intergerStr && [intergerStr isKindOfClass:[NSString class]]) {
            return intergerStr;
        }
    }
    return @"";
}


- (NSNumber *)getCurrencyForKey:(NSString *)newKey{
    NSNumber *str = [self objectForKey:newKey];
    if (str && [str isKindOfClass:[NSNumber class]]) {
        return str;
    }
    if ([self objectForKey:newKey]) {
        NSNumber *intergerStr = [self objectForKey:newKey];
        if (intergerStr && [intergerStr isKindOfClass:[NSString class]]) {
            return intergerStr;
        }
    }
    return @0;
}

- (NSInteger)getIntegerForKey:(NSString *)newKey{
    if ([self objectForKey:newKey]) {
        return [[self objectForKey:newKey] integerValue];
    }
    return 0;
}

@end

//
//  NSData+Compression.h
//  mixcloud
//
//  Created by 东坡 on 2020/10/28.
//  Copyright © 2020 Jovision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 压缩和解压缩
@interface NSData (Compression)
/// 解压 gzip 数据
- (NSData *)hb_gzipInflate;

/// 以 gzip 压缩
- (NSData *)hb_gzipDeflate;

/// 解压 zlib 数据
- (NSData *)hb_zlibInflate;

/// 以 zlib 压缩
- (NSData *)hb_zlibDeflate;
@end

NS_ASSUME_NONNULL_END

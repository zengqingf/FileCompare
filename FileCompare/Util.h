//
//  Util.h
//  FileCompare
//
//  Created by zengqingfu on 16/8/31.
//  Copyright © 2016年 zengqingfu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (NSString *)md5StringWithPath:(NSString *)path;
+ (void)compareFilesWithPathA:(NSString *)pathA pathB:(NSString *)pathB;
@end

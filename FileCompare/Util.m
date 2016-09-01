//
//  Util.m
//  FileCompare
//
//  Created by zengqingfu on 16/8/31.
//  Copyright © 2016年 zengqingfu. All rights reserved.
//

#import "Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Util
+ (NSString *)md5StringWithPath:(NSString *)path {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    if (handle == nil) {
        return nil;
    }
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done) {
        NSData *fileData = [handle readDataOfLength:256];
        CC_LONG len = (CC_LONG)fileData.length;
        if(len == 0){
            done = YES;
        } else {
            CC_MD5_Update(&md5, [fileData bytes], len);
        }
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *md5String = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                           digest[0], digest[1],
                           digest[2], digest[3],
                           digest[4], digest[5],
                           digest[6], digest[7],
                           digest[8], digest[9],
                           digest[10], digest[11],
                           digest[12], digest[13],
                           digest[14], digest[15]];
    return md5String;
}

+ (void)compareFilesWithPathA:(NSString *)pathA pathB:(NSString *)pathB {
    NSFileManager * fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:pathA isDirectory:&isDir];
    if (isExist) {
        if (isDir) {
            NSError *error = nil;
            NSArray * dirArray = [fileManger contentsOfDirectoryAtPath:pathA error:&error];
            if (error) return;
            for (NSString * str in dirArray) {
                NSString * subPathA = [pathA stringByAppendingPathComponent:str];
                NSString * subPathB = [pathB stringByAppendingPathComponent:str];
                [self compareFilesWithPathA:subPathA pathB:subPathB];
            }
        } else { //比对文件是否一样，不一样就输出pathA
            NSString *md5_A = [self md5StringWithPath:pathA];
            NSString *md5_B = [self md5StringWithPath:pathB];
            
            BOOL isEqual = [md5_A isEqualToString:md5_B];
            if (!isEqual) {
                NSLog(@"%@", pathA);
            }
        }
    }
}
@end

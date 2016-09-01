//
//  main.m
//  FileCompare
//
//  Created by zengqingfu on 16/8/31.
//  Copyright © 2016年 zengqingfu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Util.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        NSString *md5 = [Util md5StringWithPath:@"/Users/zengqingfu/Downloads/charles/破解版/charles/charles_16x16.gif"];
//        NSLog(@"%@", md5);
        
        NSString *pathB = @"/Users/zengqingfu/Downloads/charles/破解版/charles/";
        NSString *pathA = @"/Users/zengqingfu/Downloads/charles/原版/charles/";
        
        [Util compareFilesWithPathA:pathA pathB:pathB];
        
        
    }
    return 0;
}

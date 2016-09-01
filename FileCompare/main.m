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
#warning-此处应该填写需要比对的文件夹
        NSString *pathA = @"/Users/zengqingfu/Downloads/pathA/";
        NSString *pathB = @"/Users/zengqingfu/Downloads/pathB/";
        [Util compareFilesWithPathA:pathA pathB:pathB];
    }
    return 0;
}

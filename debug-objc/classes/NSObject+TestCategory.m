//
//  NSObject+TestCategory.m
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "NSObject+TestCategory.h"

@implementation NSObject (TestCategory)

+ (void)load {
    NSLog(@"NSObject category load");
}

+ (void)categoryClassMethod {
    NSLog(@"NSObject categoryClassMethod");
}

- (void)categoryInstanceMethod {
    NSLog(@"NSObject categoryInstanceMethod");
}

@end

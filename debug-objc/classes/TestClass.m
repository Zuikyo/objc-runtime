//
//  TestClass.m
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass.h"

@implementation TestClass

+ (void)initialize {
    NSLog(@"TestClass initialize");
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

+ (void)classMethod {
    NSLog(@"TestClass classMethod");
}

- (void)instanceMethod {
    NSLog(@"instanceMethod");
}

@end

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

- (CGRect)structValue {
    return CGRectMake(1, 1, 1, 1);
}

- (long double)longDoubleValue {
    return 1.0001;
}

- (_Complex long double)complexLongDoubleValue {
    return 1.0001;
}

- (void)overridedInstanceMethod {
    
}

@end

@interface SubClass : TestClass

@end

@implementation SubClass

- (CGRect)structValue {
    return [super structValue];
}

- (long double)longDoubleValue {
    long double value = [super longDoubleValue];
    return value;
}

- (_Complex long double)complexLongDoubleValue {
    _Complex long double value = [super complexLongDoubleValue];
    return value;
}

- (void)overridedInstanceMethod {
    [super overridedInstanceMethod];
}

@end

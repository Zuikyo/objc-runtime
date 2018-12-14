//
//  TestClass+TestCategory.m
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass+TestCategory.h"

@implementation TestClass (TestCategory)

+ (void)categoryClassMethod {
    NSLog(@"TestClass categoryClassMethod");
}

- (void)categoryInstanceMethod {
    NSLog(@"TestClass categoryInstanceMethod");
}

- (void)instanceMethod {
    // 编译后，在 __objc_const 的 class_ro_t 的 method list 中，category 的方法排在类中的同名方法的前面，因此会覆盖原方法
    NSLog(@"override instanceMethod in category");
}

@end

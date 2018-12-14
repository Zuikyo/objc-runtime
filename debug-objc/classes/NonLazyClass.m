//
//  NonLazyClass.m
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "NonLazyClass.h"

@implementation NonLazyClass

+ (void)load {
    // 有 +load 方法的类会保存在 __objc_nlclslist section 中
    NSLog(@"NonLazyClass load");
}

@end

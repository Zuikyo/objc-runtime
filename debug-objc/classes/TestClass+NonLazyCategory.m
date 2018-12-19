//
//  TestClass+NonLazyCategory.m
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass+NonLazyCategory.h"

@implementation TestClass (NonLazyCategory)

+ (void)load {
    // 有 +load 方法的 category 会保存在 __objc_nlcatlist section 中
    NSLog(@"TestClass category load");
}

+ (void)nonLazyCategoryClassMethod {
    NSLog(@"TestClass nonLazyCategoryClassMethod");
}

- (void)nonLazyCategoryInstanceMethod {
    NSLog(@"TestClass nonLazyCategoryInstanceMethod");
}

@end

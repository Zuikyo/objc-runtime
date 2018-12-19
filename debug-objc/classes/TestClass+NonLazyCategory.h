//
//  TestClass+NonLazyCategory.h
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass.h"

NS_ASSUME_NONNULL_BEGIN

// 有 +load 方法的的 category
@interface TestClass (NonLazyCategory)

+ (void)nonLazyCategoryClassMethod;
- (void)nonLazyCategoryInstanceMethod;

@end

NS_ASSUME_NONNULL_END

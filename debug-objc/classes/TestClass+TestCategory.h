//
//  TestClass+TestCategory.h
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass.h"

NS_ASSUME_NONNULL_BEGIN

// 自定义类的 category
@interface TestClass (TestCategory)

+ (void)categoryClassMethod;
- (void)categoryInstanceMethod;

// 覆盖类中原有的方法
- (void)instanceMethod;

@end

NS_ASSUME_NONNULL_END

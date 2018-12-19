//
//  TestClass+TestCategory.h
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import "TestClass.h"

NS_ASSUME_NONNULL_BEGIN

// 自定义类的 category；如果没有 +load 方法，同一个 mach-o 中的 category 的方法可能会直接编译到类的 method list 中
@interface TestClass (TestCategory)

+ (void)categoryClassMethod;
- (void)categoryInstanceMethod;

// 覆盖类中原有的方法
- (void)instanceMethod;

@end

NS_ASSUME_NONNULL_END

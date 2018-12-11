
//  main.m
//  debug-objc
//
//  Created by closure on 2/24/16.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
// note: 有些文件没有被包含在工程内，因为导入后编译时会和系统头文件冲突

@interface TestClass : NSObject

@end
@implementation TestClass

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

+ (void)classMethod {
    
}
- (void)instanceMethod {
    
}
@end

@interface NonLazyClass : NSObject

@end
@implementation NonLazyClass

+ (void)load {
    // 有 +load 方法的类会保存在 __objc_nlclslist section 中
}

@end

// 自定义类的 category
@interface TestClass (TestCategory)

@end
@implementation TestClass (TestCategory)
+ (void)categoryClassMethod {
    
}
- (void)categoryInstanceMethod {
    
}
@end

// 有 +load 方法的的 category
@interface TestClass (NonLazyCategory)

@end
@implementation TestClass (NonLazyCategory)
+ (void)load {
    // 有 +load 方法的 category 会保存在 __objc_nlcatlist section 中
}
@end

// 外部类的 category
@interface NSObject (TestCategory)

@end
@implementation NSObject (TestCategory)
+ (void)categoryClassMethod {
    
}
- (void)categoryInstanceMethod {
    
}
@end

void testAssociatedObject() {
    TestClass * object = [TestClass new];
    objc_setAssociatedObject(object, "123", @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

void testRetainCount() {
    NSMutableArray<NSMutableArray *> *arrays = [NSMutableArray array];
    id a = [NSObject new];
    for (int i = 0; i < 258; i++) {
        NSMutableArray *array = [NSMutableArray array];
        [arrays addObject:array];
        [array addObject:a];
    }
    NSInteger rc = CFGetRetainCount((__bridge CFTypeRef)(a));
    NSLog(@"%ld", rc);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        testAssociatedObject();
        testRetainCount();
    }
    return 0;
}

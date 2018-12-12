//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
// note: 有些文件没有被包含在工程内，因为导入后编译时会和系统头文件冲突

@interface TestClass : NSObject

@end
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
    
}
- (void)instanceMethod {
    NSLog(@"instanceMethod");
}
@end

@interface NonLazyClass : NSObject

@end
@implementation NonLazyClass

+ (void)load {
    // 有 +load 方法的类会保存在 __objc_nlclslist section 中
    NSLog(@"NonLazyClass load");
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
- (void)instanceMethod {
    NSLog(@"override instanceMethod in category");
}
@end

// 有 +load 方法的的 category
@interface TestClass (NonLazyCategory)

@end
@implementation TestClass (NonLazyCategory)
+ (void)load {
    // 有 +load 方法的 category 会保存在 __objc_nlcatlist section 中
    NSLog(@"TestClass category load");
}
@end

// 外部类的 category
@interface NSObject (TestCategory)

@end
@implementation NSObject (TestCategory)
+ (void)load {
    NSLog(@"NSObject category load");
}
+ (void)categoryClassMethod {
    
}
- (void)categoryInstanceMethod {
    
}
@end

void testOverrideInCategory() {
    TestClass *object = [TestClass new];
    [object instanceMethod];
}

void testWeak() {
    @autoreleasepool {
        __weak TestClass *weakObject = [TestClass new];
    }
}

void testAssociatedObject() {
    TestClass * object = [TestClass new];
    objc_setAssociatedObject(object, "123", @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

void testRetainCount() {
    id a = [NSObject new];
    @autoreleasepool {
        NSMutableArray<NSMutableArray *> *arrays = [NSMutableArray array];
        for (int i = 0; i < 258; i++) {
            NSMutableArray *array = [NSMutableArray array];
            [arrays addObject:array];
            [array addObject:a];
        }
        NSInteger rc = CFGetRetainCount((__bridge CFTypeRef)(a));
        NSLog(@"retain count: %ld", rc);
    }
    NSInteger rc = CFGetRetainCount((__bridge CFTypeRef)(a));
    NSLog(@"retain count: %ld", rc);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        testRetainCount();
        testOverrideInCategory();
        testWeak();
        testAssociatedObject();
        
    }
    return 0;
}

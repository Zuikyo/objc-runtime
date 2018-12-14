//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
// note: 有些文件没有被包含在工程内，因为导入后编译时会和系统头文件冲突，例如 oobjc-object.h

#import "TestClass.h"

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

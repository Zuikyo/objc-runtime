
//  main.m
//  debug-objc
//
//  Created by closure on 2/24/16.
//
//

#import <Foundation/Foundation.h>
// note: 有些文件没有被包含在工程内，因为导入后编译时会和系统头文件冲突

@interface TestClass : NSObject

@end
@implementation TestClass

- (void)test {
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
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
    return 0;
}

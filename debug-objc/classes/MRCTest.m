//
//  MRCTest.m
//  debug-objc
//
//  Created by zuik on 2018/12/20.
//

#import "MRCTest.h"

@implementation MRCTest

- (void)dealloc {
    [super dealloc];
    NSLog(@"MRCTest dealloc");
}

- (oneway void)release {
    [super release];
    NSLog(@"MRCTest release");
}

+ (void)test {
    MRCTest *obj = [MRCTest new];
    @autoreleasepool {
        
        @autoreleasepool {
            [obj autorelease];
        }
        
    }
}

@end

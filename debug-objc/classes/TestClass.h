//
//  TestClass.h
//  debug-objc
//
//  Created by zuik on 2018/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestClass : NSObject

- (void)instanceMethod;

/**
 -(void *)copiedString {
    rax = objc_getProperty(self, _cmd, *ivar_offset(_copiedString), NO);
    return rax;
 }
 
 -(void)setCopiedString:(void *)arg2 {
    objc_setProperty_nonatomic_copy(self, _cmd, arg2, *ivar_offset(_copiedString));
 }
 */
@property (nonatomic, copy) NSString *copiedString;

/**
 -(void *)strongString {
    rax = self->_strongString;
    return rax;
 }
 
 -(void)setStrongString:(void *)arg2 {
    objc_storeStrong(&self->_strongString, arg2);
 }
 */
@property (nonatomic, strong) NSString *strongString;

/**
 unsafe_unretained is same
 
 -(void *)assignString {
    rax = self->_assignString;
    return rax;
 }
 
 -(void)setAssignString:(void *)arg2 {
    self->_assignString = arg2;
 }
 */
@property (nonatomic, assign) NSString *assignString;

/**
 -(void *)weakString {
    rax = objc_loadWeakRetained(&self->_weakString);
    rax = objc_autoreleaseReturnValue(rax);
    return rax;
 }
 
 -(void)setWeakString:(void *)arg2 {
    objc_storeWeak(&self->_weakString, arg2);
 }
 */
@property (nonatomic, weak) NSString *weakString;

/**
 -(void *)atomicCopiedString {
    rax = objc_getProperty(self, _cmd, *ivar_offset(_atomicCopiedString), YES);
    return rax;
 }
 
 -(void)setAtomicCopiedString:(void *)arg2 {
    objc_setProperty_atomic_copy(self, _cmd, arg2, *ivar_offset(_atomicCopiedString));
 }
 */
@property (atomic, copy) NSString *atomicCopiedString;

/**
 -(void *)atomicStrongString {
    rax = objc_getProperty(self, _cmd, *ivar_offset(_atomicStrongString), YES);
    return rax;
 }
 
 -(void)setAtomicStrongString:(void *)arg2 {
    objc_setProperty_atomic(self, _cmd, arg2, *ivar_offset(_atomicStrongString));
 }
 */
@property (atomic, strong) NSString *atomicStrongString;

/**
 unsafe_unretained is same
 
 -(void *)atomicAssignString {
    rax = self->_atomicAssignString;
    return rax;
 }
 
 -(void)setAtomicAssignString:(void *)arg2 {
    self->_atomicAssignString = arg2;
 }
 */
@property (atomic, assign) NSString *atomicAssignString;

/**
 -(void *)atomicWeakString {
    rax = objc_loadWeakRetained(&self->_atomicWeakString);
    rax = objc_autoreleaseReturnValue(rax);
    return rax;
 }
 
 -(void)setAtomicWeakString:(void *)arg2 {
    objc_storeWeak(&self->_atomicWeakString, arg2);
 }
 */
@property (atomic, weak) NSString *atomicWeakString;

- (CGRect)structValue;
- (long double)longDoubleValue;
- (_Complex long double)complexLongDoubleValue;

@end

NS_ASSUME_NONNULL_END

//
//  TestCPP.cpp
//  debug-objc
//
//  Created by zuik on 2018/12/18.
//

#include "TestCPP.hpp"

// 在 dyld 的 ImageLoaderMachO::doModInitFunctions 中，调用保存在 __DATA,__objc_init_func 中的初始化函数 _GLOBAL__sub_I_TestCPP.cpp，初始化 C++ 全局变量
static TestCPPClass staticTestCPPClass;
TestCPPClass globalTestCPPClass;

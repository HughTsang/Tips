//
//  DefineConstant.h
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#ifndef DefineConstant_h
#define DefineConstant_h

//-------------------适配问题-------------------------
//获取屏幕宽度  高度
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define kNavigationBarHeight 64 //导航栏高度
#define kTabBarHeight        49 //tabbar高度


//-------------------懒加载-------------------------
#define Lazy(object, assignment) (object = object ?: assignment)

//----------------------系统----------------------------

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//判读系统版本是不是iOS7以上
#define iOS7 ((IOS_VERSION >= 7.0)?YES:NO)
#define iOS8 ((IOS_VERSION >= 8.0)?YES:NO)
#define iOS9 ((IOS_VERSION >= 9.0)?YES:NO)

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//----------------------沙盒相关----------------------------

//NSUserDefaults 实例化
#define UserDefault [NSUserDefaults standardUserDefaults]

//----------------------沙盒相关----------------------------

//不需要打印 设置为RELEASE
#ifdef DEBUG
//一个高级的 NSLog  显示调用的类名以及方法名
#   define ULog(format, ...) do {      \
fprintf(stderr,  "\n----开始----Begin\n" );\
fprintf(stderr,  "<%s : %d> %s\n" ,                                         \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr,  "\n----结束----End\n" );\
} while ( 0 )
#else
#   define ULog(...)
#endif

#ifdef __cplusplus
#define HZKIT_EXTERN    extern "C" __attribute__((visibility ("default")))
#else
#define HZKIT_EXTERN    extern __attribute__((visibility ("default")))
#endif

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* DefineConstant_h */

//
//  NSMutableDictionary+Extension.m
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)

+ (void)load{
    
    __unsafe_unretained Class cls = NSClassFromString(@"__NSDictionaryM");
    
    Method original = class_getInstanceMethod(cls, @selector(setObject:forKey:));
    Method new = class_getInstanceMethod(cls, @selector(hz_setObject:forKey:));
    
    method_exchangeImplementations(original, new);
}

//- (NSString *)descriptionWithLocale:(id)locale{
//    
//    NSMutableString *strM = [NSMutableString stringWithFormat:@"Count_K-V:%lu {\n", (unsigned long)self.allKeys.count];
//    for (NSString *key in self.allKeys) {
//        id object = self[key];
//        [strM appendFormat:@"\t \"%@\" = %@;\n", key, object];
//    }
//    [strM appendString:@"}"];
//    return strM;
//}

- (void)hz_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    
    if (anObject) {
        [self hz_setObject:anObject forKey:aKey];
    }else {
        printf("\t字典(%p)不能添加空对象!\n", self);
    }
}

@end

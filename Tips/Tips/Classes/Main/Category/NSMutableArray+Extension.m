//
//  NSMutableArray+Extension.m
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)

+ (void)load{
    
    __unsafe_unretained Class cls = NSClassFromString(@"__NSArrayM");
    
    Method original = class_getInstanceMethod(cls, @selector(addObject:));
    Method new = class_getInstanceMethod(cls, @selector(hz_addObject:));
    method_exchangeImplementations(original, new);
    
    original = class_getInstanceMethod(cls, @selector(objectAtIndex:));
    new = class_getInstanceMethod(cls, @selector(hz_objectAtIndex:));
    method_exchangeImplementations(original, new);
}

//- (NSString *)descriptionWithLocale:(id)locale{
//    
//    NSMutableString *strM = [NSMutableString stringWithFormat:@"Count:%lu (\n", (unsigned long)self.count];
//    for (id object in self) {
//        [strM appendFormat:@"\t %@,\n", object];
//    }
//    [strM appendString:@")"];
//    return strM;
//}

- (void)hz_addObject:(id)anObject{
    
    if (anObject) {
        [self hz_addObject:anObject];
    }else{
        printf("\t数组(%p)不能添加空对象!\n", self);
    }
}

- (id)hz_objectAtIndex:(NSUInteger)index{
    
    id object = nil;
    if (index < self.count) {
        object = [self hz_objectAtIndex:index];
    }else{
        printf("\t数组(%p)越界访问 -> index:%lu\n", self, index);
    }
    return object;
}

@end

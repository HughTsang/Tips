//
//  UIColor+Extension.m
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithRGBHex:(UInt32)hex{
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}
//-------------黑色
+ (UIColor *)cBlack_0{
    UIColor *color = [UIColor colorWithRGBHex:0x1b1b1b];
    return color;
}
+ (UIColor *)cBlack_1{
    UIColor *color = [UIColor colorWithRGBHex:0x313131];
    return color;
}
+ (UIColor *)cBlack_2{
    UIColor *color = [UIColor colorWithRGBHex:0x434343];
    return color;
}
+ (UIColor *)cBlack_3{
    UIColor *color = [UIColor colorWithRGBHex:0x535353];
    return color;
}
+ (UIColor *)cBlack_4{
    UIColor *color = [UIColor colorWithRGBHex:0x626262];
    return color;
}
+ (UIColor *)cBlack_5{
    UIColor *color = [UIColor colorWithRGBHex:0x707070];
    return color;
}
+ (UIColor *)cBlack_6{
    UIColor *color = [UIColor colorWithRGBHex:0x7d7d7d];
    return color;
}
+ (UIColor *)cBlack_7{
    UIColor *color = [UIColor colorWithRGBHex:0x898989];
    return color;
}
+ (UIColor *)cBlack_8{
    UIColor *color = [UIColor colorWithRGBHex:0x959595];
    return color;
}
+ (UIColor *)cBlack_9{
    UIColor *color = [UIColor colorWithRGBHex:0xa0a0a0];
    return color;
}

//-------------灰色
+ (UIColor *)cGray_0{
    UIColor *color = [UIColor colorWithRGBHex:0xb5b5b5];
    return color;
}
+ (UIColor *)cGray_1{
    UIColor *color = [UIColor colorWithRGBHex:0xbfbfbf];
    return color;
}
+ (UIColor *)cGray_2{
    UIColor *color = [UIColor colorWithRGBHex:0xc9c9c9];
    return color;
}
+ (UIColor *)cGray_3{
    UIColor *color = [UIColor colorWithRGBHex:0xd2d2d2];
    return color;
}
+ (UIColor *)cGray_4{
    UIColor *color = [UIColor colorWithRGBHex:0xdcdcdc];
    return color;
}
+ (UIColor *)cGray_5{
    UIColor *color = [UIColor colorWithRGBHex:0xe5e5e5];
    return color;
}
+ (UIColor *)cGray_6{
    UIColor *color = [UIColor colorWithRGBHex:0xeeeeee];
    return color;
}

//-------------其他UI颜色
+ (UIColor *)cSandyOrangeColor{
    UIColor *color = [UIColor colorWithRGBHex:0xf6ab1a];
    return color;
}

+ (UIColor *)cDeepSkyBlueColor{
    UIColor *color = [UIColor colorWithRGBHex:0x00BFFF];
    return color;
}

@end

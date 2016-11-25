//
//  OOGraphicsImage.m
//  BaseFramework
//
//  Created by Beelin on 16/11/25.
//  Copyright © 2016年 Mantis-man. All rights reserved.
//

#import "OOGraphicsImage.h"

@implementation OOGraphicsImage

- (void)drawRect:(CGRect)rect {
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx, rect);
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    CGContextFillPath(ctx);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    UIImageView *imv = [[UIImageView alloc] init];
//    imv.frame = rect;
//    imv.image = img;
//    [self addSubview:imv];
    
    [self drawCopyImage];
}


/** 复制图片 */
- (void)drawCopyImage{
    UIImage *image = [UIImage imageNamed:@"placeholder"];
    CGSize size = image.size;
    
    UIGraphicsBeginImageContextWithOptions((CGSize){size.width *2, size.height}, NO, 0);
    [image drawAtPoint:CGPointMake(0, 0)];
    [image drawAtPoint:CGPointMake(size.width, 0)];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imv = [[UIImageView alloc] initWithImage:img];
    [self addSubview:imv];
}

/** 缩放图片 */
- (void)drawSalceImage{
    UIImage* mars = [UIImage imageNamed:@"Mars.png"];
    CGSize sz = [mars size];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*2, sz.height*2), NO, 0);
    [mars drawInRect:CGRectMake(0,0,sz.width*2,sz.height*2)];
    [mars drawInRect:CGRectMake(sz.width/2.0, sz.height/2.0, sz.width, sz.height) blendMode:kCGBlendModeMultiply alpha:1.0];
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
@end

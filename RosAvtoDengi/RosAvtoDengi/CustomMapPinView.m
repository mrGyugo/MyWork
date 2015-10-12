//
//  CustomMapPinView.m
//  RosAvtoDengi
//
//  Created by Viktor on 10.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "CustomMapPinView.h"

@implementation CustomMapPinView

- (instancetype)initWithImage
{
    self = [super init];
    if (self) {
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -10, 25, 40)];
        
        imageView.image = [UIImage imageNamed:@"google-map-pointer-yellow-hi.png"];
        
        [self addSubview:imageView];
        

    }
    return self;
}

@end

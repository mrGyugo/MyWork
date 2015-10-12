//
//  Animathion.m
//  RosAvtoDengi
//
//  Created by Viktor on 10.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "Animathion.h"

@implementation Animathion

+ (void) animateLayer: (UILabel *) view {
    CATransition* animation = [CATransition animation];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromLeft];
    [animation setDuration:0.35f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFillMode:kCAFillModeBoth];
    
    [view.layer addAnimation:animation forKey:nil];
    
}



@end

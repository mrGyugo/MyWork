//
//  Parser.m
//  RosAvtoDengi
//
//  Created by Viktor on 11.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "Parser.h"
#import <CoreGraphics/CoreGraphics.h>


@implementation Parser

//Парсинг данных------------------------------------------
+ (NSDictionary*)mts_mapping
{
    return @{@"recall_name": mts_key(recall_name),
             @"recall_work": mts_key(recall_work),
             @"recall_text": mts_key(recall_text)
             };
}


@end

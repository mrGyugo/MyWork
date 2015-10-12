//
//  Parser.h
//  RosAvtoDengi
//
//  Created by Viktor on 11.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Motis/Motis.h>

@interface Parser : NSObject

@property (strong, nonatomic) NSString * recall_name;
@property (strong, nonatomic) NSString * recall_work;
@property (strong, nonatomic) NSString * recall_text;
@property (assign, nonatomic) CGFloat targetHeight;

@end

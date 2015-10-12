//
//  APINews.h
//  RosAvtoDengi
//
//  Created by Viktor on 10.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface APINews : NSObject

- (void) getDataFromServerWithMethod: (NSDictionary *) params method: (NSString*) method complitionBlock:
(void (^) (id response)) complitionBlock;

@end

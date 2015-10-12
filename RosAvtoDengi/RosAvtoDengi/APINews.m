//
//  APINews.m
//  RosAvtoDengi
//
//  Created by Viktor on 10.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "APINews.h"

#define MAIN_URL @"http://rosavtodengi.ru/ios/api.php"
#define API_KEY @"R6tYkBhREgYp6ioXDx7gAkzHfCZnGfnfFSEgkbEhjlMr05lii9MF6"

@implementation APINews

//Выгрузка JSON----------------------------------------------------------

- (void) getDataFromServerWithMethod: (NSDictionary *) params method: (NSString*) method complitionBlock:
(void (^) (id response)) complitionBlock {
    
    NSString * url = [NSString stringWithFormat:@"%@?%@&api_key=%@",MAIN_URL,method,API_KEY];

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        complitionBlock (responseObject);
        
//                NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end

//
//  EarthquakesService.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesService.h"

#import "EarthquakesRequest.h"
#import "EarthquakesList.h"
#import "SessionService.h"

#import <AFNetworking/AFNetworking.h>

@implementation EarthquakesService

- (void)retrieveEarthquakes
{
    EarthquakesRequest *request = [[EarthquakesRequest alloc] init];

    AFHTTPSessionManager *sessionManager = [SessionService sharedInstance].sessionManager;
    [sessionManager GET:request.url.absoluteString
             parameters:request.parameters
               progress:nil
                success:^(NSURLSessionDataTask *task, id responseObject) {

                    NSError *error;
                    EarthquakesList *earthquakesList = [MTLJSONAdapter modelOfClass:EarthquakesList.class
                                                                 fromJSONDictionary:responseObject
                                                                              error:&error];
                    NSLog(@"%@", earthquakesList);
                }
                failure:^(NSURLSessionDataTask *task, NSError *httpError) {
                    // Handle error here
                }];

}

@end

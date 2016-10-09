//
//  EarthquakesController.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesController.h"
#import "EarthquakesService.h"

@interface EarthquakesController ()

@property (nonatomic, strong) EarthquakesService *service;

@end

@implementation EarthquakesController

- (instancetype)initWithService:(EarthquakesService *)service
{
    self = [super init];

    if (self) {
        _service = service;
    }

    return self;
}

- (instancetype)init
{
    EarthquakesService *service = [[EarthquakesService alloc] init];
    return [self initWithService:service];
}

- (void)retrieveEarthquakes
{
    [self.service retrieveEarthquakes];
}

@end

//
//  EarthquakesService.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class encapsulates the logic to retrieve earthquake information
 */
@interface EarthquakesService : NSObject

/**
 This method makes an EarthquakesRequest API call
 */
- (void)retrieveEarthquakes;

@end

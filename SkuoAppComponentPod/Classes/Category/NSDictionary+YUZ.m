//
//  NSDictionary+YUZ.m
//  happyvalley
//
//  Created by maojun on 2017/5/12.
//  Copyright © 2017年 XLsn0w. All rights reserved.
//

#import "NSDictionary+YUZ.h"

@implementation NSDictionary (YUZ)

- (id)YUZ_objectForKey:(id)key
{
    id keyValue = [self objectForKey:key];
    if (keyValue == [NSNull null])
    {
        return nil;
    }
    else {
        return keyValue;
    }
}

@end

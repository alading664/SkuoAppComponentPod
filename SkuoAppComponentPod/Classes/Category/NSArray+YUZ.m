//
//  NSArray+YUZ.m
//  happyvalley
//
//  Created by maojun on 2017/4/5.
//  Copyright © 2017年 skuo. All rights reserved.
//

#import "NSArray+YUZ.h"

@implementation NSArray (YUZ)

- (id)YUZ_AtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    else {
        return [self objectAtIndex:index]==[NSNull null]?nil:[self objectAtIndex:index];
    }
}

@end

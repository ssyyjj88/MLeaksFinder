//
//  NSObject+MemoryLeak.h
//  LeakFinderMy
//
//  Created by syj on 2019/7/1.
//  Copyright © 2019年 syj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MemoryLeak)

- (BOOL)willDealloc;

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end

NS_ASSUME_NONNULL_END

//
//  UINavigationController+MemoryLeak.h
//  LeakFinderMy
//
//  Created by syj on 2019/7/1.
//  Copyright © 2019年 syj. All rights reserved.
//

#import <UIKit/UIKit.h>

#if _INTERNAL_MLF_ENABLED
NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (MemoryLeak)

@end

NS_ASSUME_NONNULL_END
#endif

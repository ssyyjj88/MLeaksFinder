//
//  UINavigationController+MemoryLeak.m
//  LeakFinderMy
//
//  Created by syj on 2019/7/1.
//  Copyright © 2019年 syj. All rights reserved.
//

#import "UINavigationController+MemoryLeak.h"
#import "NSObject+MemoryLeak.h"
#import <objc/runtime.h>
#import "MLeaksFinder.h"

#if _INTERNAL_MLF_ENABLED
static const void *const kPoppedDetailVCKey = &kPoppedDetailVCKey;

@implementation UINavigationController (MemoryLeak)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(popViewControllerAnimated:) withSEL:@selector(swizzled_popViewControllerAnimated:)];
    });
}

- (UIViewController *)swizzled_popViewControllerAnimated:(BOOL)animated {
    UIViewController *poppedViewController = [self swizzled_popViewControllerAnimated:animated];
    
    if (!poppedViewController) {
        return nil;
    }
    
    // Detail VC in UISplitViewController is not dealloced until another detail VC is shown
    if (self.splitViewController &&
        self.splitViewController.viewControllers.firstObject == self &&
        self.splitViewController == poppedViewController.splitViewController) {
        objc_setAssociatedObject(self, kPoppedDetailVCKey, poppedViewController, OBJC_ASSOCIATION_RETAIN);
        return poppedViewController;
    }
    
    // VC is not dealloced until disappear when popped using a left-edge swipe gesture
    extern const void *const kHasBeenPoppedKey;
    objc_setAssociatedObject(poppedViewController, kHasBeenPoppedKey, @(YES), OBJC_ASSOCIATION_RETAIN);
    
    return poppedViewController;
}

@end
#endif

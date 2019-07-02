//
//  LeakVC.m
//  LeakFinderMy
//
//  Created by syj on 2019/7/1.
//  Copyright © 2019年 syj. All rights reserved.
//

#import "LeakVC.h"

@interface LeakVC ()

@property (copy)  void (^block)(int quantity);

@end

@implementation LeakVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    self.block = ^(int quantity) {
        [self doSomething];
    };
}

- (void)doSomething {
    
}

- (void)dealloc {
    NSLog(@"dealloc:%s", __func__);
}

@end

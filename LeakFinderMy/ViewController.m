//
//  ViewController.m
//  LeakFinderMy
//
//  Created by syj on 2019/7/1.
//  Copyright © 2019年 syj. All rights reserved.
//

#import "ViewController.h"
#import "LeakVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn addTarget:self action:@selector(touches) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"do" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:btn];
}

- (void)touches {
    LeakVC *vc = [[LeakVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}


@end

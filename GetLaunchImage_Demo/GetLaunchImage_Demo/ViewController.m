//
//  ViewController.m
//  GetLaunchImage_Demo
//
//  Created by ian on 16/3/5.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger osVersion = floor([[[UIDevice currentDevice] systemVersion] floatValue])*100;
    NSString *key;
    if (osVersion >= 700) {
        key = @"UILaunchImages";
    } else {
        key = @"UILaunchImageFile";
    }
    NSArray *array = [[[NSBundle mainBundle] infoDictionary] valueForKey:key];
    NSLog(@"%@",array);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

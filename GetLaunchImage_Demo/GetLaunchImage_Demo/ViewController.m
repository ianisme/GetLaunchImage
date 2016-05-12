//
//  ViewController.m
//  GetLaunchImage_Demo
//
//  Created by ian on 16/3/5.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "ViewController.h"
#import "GetLaunchImage.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - life style

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self printUILaunchImageName];
    [self creatView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method

- (void)creatView
{
    UIImageView *view = [[UIImageView alloc] init];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width*0.8, self.view.frame.size.height*0.8);
    view.center = self.view.center;
    view.image = [GetLaunchImage getTheLaunchImage];
    [self.view addSubview:view];
}

- (void)printUILaunchImageName
{
    NSInteger osVersion = floor([[[UIDevice currentDevice] systemVersion] floatValue])*100;
    NSString *key;
    if (osVersion >= 700) {
        key = @"UILaunchImages";
    } else {
        key = @"UILaunchImageFile";
    }
    NSArray *array = [[[NSBundle mainBundle] infoDictionary] valueForKey:key];
    NSLog(@"%@",array);
}

@end

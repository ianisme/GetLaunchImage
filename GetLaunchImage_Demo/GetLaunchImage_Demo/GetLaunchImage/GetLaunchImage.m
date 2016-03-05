//
//  GetLaunchImage.m
//  IAN-RTLabel
//
//  Created by ian on 15/10/12.
//  Copyright © 2015年 ian. All rights reserved.
//

#import "GetLaunchImage.h"

@implementation GetLaunchImage

+ (UIImage *)getTheLaunchImage
{
    NSString *defaultImageName = @"LaunchImage";
    NSInteger osVersion = floor([[[UIDevice currentDevice] systemVersion] floatValue])*100;
    if (osVersion > 800){
        osVersion = 800;
    }
    NSInteger screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    // 3.5inch
    if (screenHeight < 568) {
        // >iOS7
        if (osVersion >= 700) {
            defaultImageName = [NSString stringWithFormat:@"%@-%zd",defaultImageName,osVersion];
        }
        // <iOS7
    }
    // 4.0inch and 4.7inch
    else if(screenHeight < 736){
        // >iOS7
        if (osVersion >= 700) {
            defaultImageName = [NSString stringWithFormat:@"%@-%zd-%zdh",defaultImageName,osVersion,screenHeight];
        }
        // <iOS7
        else {
            defaultImageName = [NSString stringWithFormat:@"%@-%zdh",defaultImageName,screenHeight];
        }
    }
    // 5.5inch
    else{
        NSString *orientation = @"";
        switch ([[UIApplication sharedApplication] statusBarOrientation]) {
            case UIInterfaceOrientationUnknown:
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:
                orientation = @"Portrait";
                break;
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                orientation = @"Landscape";
                break;
            default:
                break;
        }
        defaultImageName = [NSString stringWithFormat:@"%@-%zd-%@-%zdh",defaultImageName,osVersion,orientation,screenHeight];
    }
    return [UIImage imageNamed:defaultImageName];
}

@end

//
//  GetLaunchImage.m
//  IAN
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
    
    NSInteger screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    // 3.5inch
    if (screenHeight < 568) {
        
        if (osVersion >= 700) {
            defaultImageName = [NSString stringWithFormat:@"%@-700",defaultImageName];
        } else {
            defaultImageName = [NSString stringWithFormat:@"%@",defaultImageName];
        }
        
    }
    // 4.0inch
    else if(screenHeight < 667){

        if (osVersion >= 700) {
            defaultImageName = [NSString stringWithFormat:@"%@-700-568h",defaultImageName];
        } else {
            defaultImageName = [NSString stringWithFormat:@"%@-568h",defaultImageName];
        }
    }
    // 4,7inch
    else if (screenHeight < 736) {
    
        defaultImageName = [NSString stringWithFormat:@"%@-800-667h",defaultImageName];
    
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
        defaultImageName = [NSString stringWithFormat:@"%@-800-%@-736h",defaultImageName,orientation];
    }
    return [UIImage imageNamed:defaultImageName];
}

@end

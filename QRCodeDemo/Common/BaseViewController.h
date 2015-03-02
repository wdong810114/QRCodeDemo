//
//  BaseViewController.h
//  Dade
//
//  Created by 王冬冬 on 15-1-21.
//  Copyright (c) 2015年 Spark. All rights reserved.
//
//  基类视图控制器

#import <UIKit/UIKit.h>

#import "Constants.h"
#import "Util.h"

@interface BaseViewController : UIViewController

- (void)setNavigationBar;
- (void)setNavigationBarTitle:(NSString *)title;
- (void)setLeftBarButtonItem:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage;
- (void)setRightBarButtonItem:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage;
- (void)setRightBarButtonItem:(SEL)action title:(NSString *)title;

- (void)pop;

@end

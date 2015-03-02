//
//  BaseViewController.m
//  Dade
//
//  Created by 王冬冬 on 15-1-21.
//  Copyright (c) 2015年 Spark. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationBar];
    
    self.view.backgroundColor = COLOR(0xf5, 0xf5, 0xf5);

    if(IOS_VERSION_7_OR_ABOVE) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(IOS_VERSION_7_OR_ABOVE) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setNavigationBar
{
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if(IOS_VERSION_7_OR_ABOVE) {
        navigationBar.translucent = NO;
        navigationBar.barTintColor = NAVIGATION_BAR_COLOR;
        [navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor]];
    } else {
        [navigationBar setBackgroundImage:[Util imageWithColor:NAVIGATION_BAR_COLOR] forBarMetrics:UIBarMetricsDefault];
    }
    
    if(!IOS_VERSION_7_OR_ABOVE) {
        self.navigationItem.hidesBackButton = YES;
    }
    self.navigationItem.titleView = nil;
}

- (void)setNavigationBarTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

- (void)setLeftBarButtonItem:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0.0, 0.0, 37.0, 35.0);
    if(IOS_VERSION_7_OR_ABOVE) {
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, -24.0, 0.0, 0.0);
    } else {
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, -4.0, 0.0, 0.0);
    }
    [leftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)setRightBarButtonItem:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highlightedImage
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0.0, 0.0, 37.0, 35.0);
    if(IOS_VERSION_7_OR_ABOVE) {
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -20.0);
    }
    [rightButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)setRightBarButtonItem:(SEL)action title:(NSString *)title
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0.0, 0.0, 37.0, 35.0);
    if(IOS_VERSION_7_OR_ABOVE) {
        rightButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -20.0);
    }
    rightButton.titleLabel.font = FONT(14.0);
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

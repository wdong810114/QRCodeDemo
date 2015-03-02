//
//  Constants.h
//  Dade
//
//  Created by 王冬冬 on 15-1-21.
//  Copyright (c) 2015年 Spark. All rights reserved.
//
//  常量定义

#define IOS_VERSION_7_OR_ABOVE              (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? (YES) : (NO))

#define DEVICE_WIDTH                        [[UIScreen mainScreen] bounds].size.width
#define DEVICE_HEIGHT                       [[UIScreen mainScreen] bounds].size.height

#define COLOR(R, G, B)                      [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define NAVIGATION_BAR_COLOR                COLOR(0xcf,0x3b,0x1d)   // 导航栏背景颜色
#define RED_BUTTON_BG_NORMAL_COLOR          COLOR(0xcf,0x3b,0x1d)   // 红色按钮背景颜色（正常）
#define RED_BUTTON_BG_HIGHLIGHTED_COLOR     COLOR(0xba,0x35,0x1a)   // 红色按钮背景颜色（高亮）

#define FONT(S)                             [UIFont systemFontOfSize:S]

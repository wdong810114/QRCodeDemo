//
//  CustomViewController.h
//  QRCodeDemo
//
//  Created by 王冬冬 on 15-3-2.
//  Copyright (c) 2015年 Spark. All rights reserved.
//

#import "BaseViewController.h"

@class CustomViewController;

@protocol CustomViewControllerDelegate <NSObject>

@required
- (void)customViewController:(CustomViewController *)customViewController scanResult:(NSString *)scanResult qrCodeImage:(UIImage *)qrCodeImage;

@end

@interface CustomViewController : BaseViewController <ZBarReaderViewDelegate>

@property (nonatomic, weak) id <CustomViewControllerDelegate> delegate;

@end

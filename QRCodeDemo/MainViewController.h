//
//  MainViewController.h
//  QRCodeDemo
//
//  Created by 王冬冬 on 15-2-27.
//  Copyright (c) 2015年 Spark. All rights reserved.
//

#import "BaseViewController.h"

@interface MainViewController : BaseViewController <ZBarReaderDelegate>

@property (weak, nonatomic) IBOutlet UITextField *generateTextField;
@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;
@property (weak, nonatomic) IBOutlet UILabel *scanResultLabel;
@property (weak, nonatomic) IBOutlet UIButton *scanButton;

- (IBAction)generateButtonClicked:(UIButton *)button;
- (IBAction)scanButtonClicked:(UIButton *)button;

@end

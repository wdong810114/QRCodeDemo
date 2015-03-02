//
//  CustomViewController.m
//  QRCodeDemo
//
//  Created by 王冬冬 on 15-3-2.
//  Copyright (c) 2015年 Spark. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

- (void)startScan;

@end

@implementation CustomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self startScan];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setNavigationBar
{
    [super setNavigationBar];
    
    [self setNavigationBarTitle:@"扫描二维码"];
    [self setLeftBarButtonItem:@selector(backClicked:) image:@"back_icon_n" highlightedImage:@"back_icon_p"];
}

- (void)backClicked:(UIButton *)button
{
    [self pop];
}

#pragma mark - Private Methods
- (void)startScan
{
    UIView *scanView = [[UIView alloc] initWithFrame:CGRectMake(20.0, 70.0, 280.0, 280.0)];
    scanView.backgroundColor = [UIColor clearColor];
    scanView.layer.borderColor = [UIColor greenColor].CGColor;
    scanView.layer.borderWidth = 0.5;
    
    ZBarReaderView *readerView = [ZBarReaderView new];
    readerView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    readerView.readerDelegate = self;
    readerView.torchMode = 0;
    readerView.allowsPinchZoom = NO;
    readerView.scanCrop = CGRectMake(scanView.frame.origin.x / self.view.frame.size.width, scanView.frame.origin.y / self.view.frame.size.height, scanView.frame.size.width / self.view.frame.size.width, scanView.frame.size.height / self.view.frame.size.height);
    readerView.tracksSymbols = NO;
    
    [readerView addSubview:scanView];
    [self.view addSubview:readerView];
    
    [readerView start];
}

#pragma mark - ZBarReaderViewDelegate Methods
- (void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    const zbar_symbol_t *symbol = zbar_symbol_set_first_symbol(symbols.zbarSymbolSet);
    NSString *symbolStr = [NSString stringWithUTF8String:zbar_symbol_get_data(symbol)];
    
    [self.delegate customViewController:self
                             scanResult:symbolStr
                            qrCodeImage:image];
    
    [readerView stop];
    
    [self pop];
}

@end

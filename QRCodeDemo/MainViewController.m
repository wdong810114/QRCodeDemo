//
//  MainViewController.m
//  QRCodeDemo
//
//  Created by 王冬冬 on 15-2-27.
//  Copyright (c) 2015年 Spark. All rights reserved.
//

#import "MainViewController.h"

#import "QRCodeGenerator.h"

@interface MainViewController ()

- (void)initView;

- (UIView *)cameraOverlayView1;
- (UIView *)cameraOverlayView2;

@end

@implementation MainViewController
{
    ZBarReaderViewController *_reader1;
    ZBarReaderController *_reader2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setNavigationBar
{
    [super setNavigationBar];
    
    [self setNavigationBarTitle:@"二维码"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

- (IBAction)generateButtonClicked:(UIButton *)button
{
    // 生成
    
    self.qrCodeImageView.image = [QRCodeGenerator qrImageForString:self.generateTextField.text
                                                         imageSize:self.qrCodeImageView.bounds.size.width];
}

- (IBAction)scanButtonClicked:(UIButton *)button
{
    // 扫描

    // 使用ZBarReaderViewController
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    reader.readerView.zoom = 1.0;
    reader.showsZBarControls = NO;
    reader.cameraOverlayView = [self cameraOverlayView1];
    [reader.scanner setSymbology:ZBAR_NONE
                          config:ZBAR_CFG_ENABLE
                              to:0];
    [reader.scanner setSymbology:ZBAR_QRCODE
                          config:ZBAR_CFG_ENABLE
                              to:1];
    _reader1 = reader;
    
    // 使用ZBarReaderController
//    ZBarReaderController *reader = [ZBarReaderController new];
//    reader.readerDelegate = self;
//    reader.showsHelpOnFail = YES;
//    if([ZBarReaderController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        reader.sourceType = UIImagePickerControllerSourceTypeCamera;
//    }
//    reader.showsCameraControls = NO;
//    reader.showsZBarControls = NO;
//    reader.cameraOverlayView = [self cameraOverlayView2];
//    [reader.scanner setSymbology:ZBAR_I25
//                          config:ZBAR_CFG_ENABLE
//                              to:0];
//    _reader2 = reader;

    [self presentViewController:reader
                       animated:YES
                     completion:NULL];
}

- (void)endScan
{
    [_reader1 dismissViewControllerAnimated:YES
                                 completion:NULL];
    _reader1 = nil;
    
    [_reader2 dismissViewControllerAnimated:YES
                                 completion:NULL];
    _reader2 = nil;
}

- (void)startScan
{
    [_reader2 takePicture];
}

#pragma mark - Private Methods
- (void)initView
{
    [self.generateButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_NORMAL_COLOR] forState:UIControlStateNormal];
    [self.generateButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    [self.generateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.scanButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_NORMAL_COLOR] forState:UIControlStateNormal];
    [self.scanButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    [self.scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.qrCodeImageView.layer.borderWidth = 1.0;
    self.qrCodeImageView.layer.borderColor = COLOR(0xcf, 0x3b, 0x1d).CGColor;
}

- (UIView *)cameraOverlayView1
{
    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    overlayView.backgroundColor = [UIColor clearColor];
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, overlayView.frame.size.height - 55.0, overlayView.frame.size.width, 55.0)];
    customView.backgroundColor = [UIColor blackColor];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake((customView.frame.size.width - 150.0) / 2, (customView.frame.size.height - 35.0) / 2, 150.0, 35.0)];
    [cancelButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_NORMAL_COLOR] forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = FONT(14.0);
    [cancelButton addTarget:self action:@selector(endScan) forControlEvents:UIControlEventTouchUpInside];
    
    [customView addSubview:cancelButton];
    [overlayView addSubview:customView];
    
    return overlayView;
}

- (UIView *)cameraOverlayView2
{
    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    overlayView.backgroundColor = [UIColor clearColor];
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, overlayView.frame.size.height - 55.0, overlayView.frame.size.width, 55.0)];
    customView.backgroundColor = [UIColor blackColor];
    
    CGFloat space = (customView.frame.size.width - 100.0 * 2) / 3;
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(space, (customView.frame.size.height - 35.0) / 2, 100.0, 35.0)];
    [cancelButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_NORMAL_COLOR] forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = FONT(14.0);
    [cancelButton addTarget:self action:@selector(endScan) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *scanButton = [[UIButton alloc] initWithFrame:CGRectMake(space * 2 + cancelButton.frame.size.width, cancelButton.frame.origin.y, cancelButton.frame.size.width, cancelButton.frame.size.height)];
    [scanButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_NORMAL_COLOR] forState:UIControlStateNormal];
    [scanButton setBackgroundImage:[Util imageWithColor:RED_BUTTON_BG_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    [scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [scanButton setTitle:@"扫描" forState:UIControlStateNormal];
    scanButton.titleLabel.font = FONT(14.0);
    [scanButton addTarget:self action:@selector(startScan) forControlEvents:UIControlEventTouchUpInside];
    
    [customView addSubview:cancelButton];
    [customView addSubview:scanButton];
    [overlayView addSubview:customView];
    
    return overlayView;
}

#pragma mark - UIImagePickerControllerDelegate Methods
- (void)imagePickerController:(UIImagePickerController *)reader didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;

    self.scanResultLabel.text = symbol.data;
    self.qrCodeImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [self endScan];
}

#pragma mark - ZBarReaderDelegate Methods
- (void)readerControllerDidFailToRead:(ZBarReaderController *)reader withRetry:(BOOL)retry
{
    if(!retry) {
        [self endScan];
    }
}

@end

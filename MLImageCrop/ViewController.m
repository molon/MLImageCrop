//
//  ViewController.m
//  MLImageCrop
//
//  Created by molon on 6/27/14.
//  Copyright (c) 2014 molon. All rights reserved.
//

#import "ViewController.h"
#import "MLImageCrop.h"

@interface ViewController ()<MLImageCropDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 50, 100, 50);
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"按1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(press1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(210, 50, 100, 50);
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"按2" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(press2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)press1
{
    MLImageCrop *imageCrop = [[MLImageCrop alloc]init];
    imageCrop.delegate = self;
    imageCrop.ratioOfWidthAndHeight = 800.0f/600.0f;
    imageCrop.image = [UIImage imageNamed:@"temp.jpg"];
    [imageCrop showWithAnimation:YES];
    
}

- (void)press2
{
    MLImageCrop *imageCrop = [[MLImageCrop alloc]init];
    imageCrop.delegate = self;
    imageCrop.ratioOfWidthAndHeight = 600.0f/600.0f;
    imageCrop.imageURL = [NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/w%3D2048/sign=6a2f2628347adab43dd01c43bfecb21c/503d269759ee3d6dc7cd12cb41166d224f4adea3.jpg"];
    [imageCrop showWithAnimation:NO];
}


#pragma mark - crop delegate
- (void)cropImage:(UIImage*)cropImage forOriginalImage:(UIImage*)originalImage
{
    self.imageView.image = cropImage;
    self.imageView.frame = CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.width*(cropImage.size.height/cropImage.size.width));
}



@end

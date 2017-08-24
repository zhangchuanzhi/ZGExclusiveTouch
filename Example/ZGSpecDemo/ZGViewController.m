//
//  ZGViewController.m
//  ZGSpecDemo
//
//  Created by zhangchuanzhi on 08/24/2017.
//  Copyright (c) 2017 zhangchuanzhi. All rights reserved.
//

#import "ZGViewController.h"
#import "UITextView+ZGLimitCounter.h"
@interface ZGViewController ()
@property(nonatomic,strong) UITextView*textView;
@end

@implementation ZGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self textView];
}
-(UITextView *)textView
{
    if (!_textView) {
        _textView=[[UITextView alloc]initWithFrame:CGRectMake(20, 64+20, [UIScreen mainScreen].bounds.size.width-40, 180)];
        _textView.layer.borderWidth=1;
        _textView.layer.borderColor=[UIColor lightGrayColor].CGColor;
        _textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _textView.zg_limitCount=200;
        _textView.zg_labHeight=30;
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

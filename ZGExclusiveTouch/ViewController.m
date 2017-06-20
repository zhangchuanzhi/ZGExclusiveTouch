//
//  ViewController.m
//  ZGExclusiveTouch
//
//  Created by offcn_zcz32036 on 2017/6/20.
//  Copyright © 2017年 offcn. All rights reserved.
//

#import "ViewController.h"
#define Start_X          50.0f      // 第一个按钮的X坐标
#define Start_Y          84.0f     // 第一个按钮的Y坐标
#define Width_Space      5.0f      // 2个按钮之间的横间距
#define Height_Space     20.0f     // 竖间距
#define Button_Height   122.0f    // 高
#define Button_Width    75.0f    // 宽
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addButtonS];
}
-(void)addButtonS
{
    for (int i = 0 ; i < 6; i++) {
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        // 圆角按钮
        UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        mapBtn.tag = i;//这句话不写等于废了
        mapBtn.frame = CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height);
        mapBtn.exclusiveTouch=YES;
        mapBtn.backgroundColor=randomColor;
        [mapBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [self.view addSubview:mapBtn];
        //按钮点击方法
        [mapBtn addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
       
        
    }
}

//点击按钮方法,这里容易犯错
-(void)mapBtnClick:(UIButton *)sender{
    //记住,这里不能写成"mapBtn.tag",这样你点击任何一个button,都只能获取到最后一个button的值,因为前边的按钮都被最后一个button给覆盖了
    NSLog(@"%ld",sender.tag);
}
-(void)viewDidAppear:(BOOL)animated
{
    [self setExclusiveTouchForButtons:self.view];
}
-(void)setExclusiveTouchForButtons:(UIView *)myView
{
    for (UIView * v in [myView subviews]) {
        if([v isKindOfClass:[UIButton class]])
            [((UIButton *)v) setExclusiveTouch:YES];
        else if ([v isKindOfClass:[UIView class]]){
            [self setExclusiveTouchForButtons:v];
        }
    }
}

@end

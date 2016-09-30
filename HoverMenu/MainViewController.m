//
//  MainViewController.m
//  HoverMenu
//
//  Created by yxhe on 16/9/30.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "MainViewController.h"
#import "HoverMenuView.h"

@interface MainViewController ()

@property (nonatomic, strong) HoverMenuView *leftHoverMenu;
@property (nonatomic, strong) HoverMenuView *rightHoverMenu;

@end

@implementation MainViewController

- (instancetype)init
{
    if (self = [super init])
    {
        self.title = @"home";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 导航栏
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                          target:self
                                                                                          action:@selector(barButtonClicked:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(barButtonClicked:)];
}

#pragma mark - 懒加载
- (HoverMenuView *)leftHoverMenu
{
    if (!_leftHoverMenu)
    {
        _leftHoverMenu = [[HoverMenuView alloc] init];
        _leftHoverMenu.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    }
    return _leftHoverMenu;
}

- (HoverMenuView *)rightHoverMenu
{
    if (!_rightHoverMenu)
    {
        
    }
    return;
}

#pragma mark - 导航栏button事件
- (void)barButtonClicked:(UIBarButtonItem *)sender
{
    if (sender == self.navigationItem.leftBarButtonItem)
    {
        // 左边弹出悬浮菜单
    }
    else if (sender == self.navigationItem.rightBarButtonItem)
    {
        // 右边弹出悬浮菜单
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

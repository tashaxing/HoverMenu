//
//  MainViewController.m
//  HoverMenu
//
//  Created by yxhe on 16/9/30.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import "MainViewController.h"
#import "HoverMenuView.h"
#import "DetailViewController.h"

@interface MainViewController ()
{
    // 左右弹出菜单bool值
    BOOL isLeftShow;
    BOOL isRightShow;
}

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
    isLeftShow = NO;
    isRightShow = NO;
}

#pragma mark - 懒加载
- (HoverMenuView *)leftHoverMenu
{
    if (!_leftHoverMenu)
    {
        _leftHoverMenu = [[HoverMenuView alloc] initWithFrame:CGRectMake(10, self.navigationController.navigationBar.frame.size.height + 25, 150, 200)];
        UIImage *leftMenuImg = [UIImage imageNamed:@"leftbg.png"];
        NSArray *leftDataArray = @[@"item1", @"item2", @"item3", @"item4", @"item5"];
        [_leftHoverMenu setBackGround:leftMenuImg withDataSource:leftDataArray anchorPoint:CGPointZero];
        [self.view addSubview:_leftHoverMenu];
        
        // block
        __weak typeof(self) weakself = self;
        _leftHoverMenu.selectBlock = ^(NSString *str){
            [weakself menuItemClicked:str];
        };
    }
    return _leftHoverMenu;
}

- (HoverMenuView *)rightHoverMenu
{
    if (!_rightHoverMenu)
    {
        _rightHoverMenu = [[HoverMenuView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - 150, self.navigationController.navigationBar.frame.size.height + 25, 150, 200)];
        UIImage *leftMenuImg = [UIImage imageNamed:@"rightbg.png"];
        NSArray *leftDataArray = @[@"option1", @"option2", @"option3", @"option4", @"option5"];
        [_rightHoverMenu setBackGround:leftMenuImg withDataSource:leftDataArray anchorPoint:CGPointMake(1, 0)];
        [self.view addSubview:_rightHoverMenu];
        
        // block
        __weak typeof(self) weakself = self;
        _rightHoverMenu.selectBlock = ^(NSString *str){
            [weakself menuItemClicked:str];
        };
    }
    return _rightHoverMenu;
}

#pragma mark - 导航栏button事件
- (void)barButtonClicked:(UIBarButtonItem *)sender
{
    if (sender == self.navigationItem.leftBarButtonItem)
    {
        // 左边弹出悬浮菜单
        NSLog(@"left button clicked");
        if (!isLeftShow)
        {
            [self.leftHoverMenu showHoverMenu];
        }
        else
        {
            [self.leftHoverMenu dismissHoverMenu];
        }
        isLeftShow = !isLeftShow;
    }
    else if (sender == self.navigationItem.rightBarButtonItem)
    {
        // 右边弹出悬浮菜单
        NSLog(@"right button clicked");
        if (!isRightShow)
        {
            [self.rightHoverMenu showHoverMenu];
        }
        else
        {
            [self.rightHoverMenu dismissHoverMenu];
        }
        isRightShow = !isRightShow;
    }
}

#pragma mark - block事件
- (void)menuItemClicked:(NSString *)item
{
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.title = item;
    [self.navigationController pushViewController:vc animated:YES];
}


@end

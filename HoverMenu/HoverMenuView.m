//
//  HoverMenuView.m
//  HoverMenu
//
//  Created by yxhe on 16/9/30.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

// ---- 悬浮菜单 ---- //

#import "HoverMenuView.h"

@interface HoverMenuView ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *menuTableView;
    NSArray *tableDataArray;
}
@end

@implementation HoverMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, self.frame.size.width, self.frame.size.height - 35)];
        menuTableView.delegate = self;
        menuTableView.dataSource = self;
        [self addSubview:menuTableView];
    }
    return self;
}

#pragma mark - 外部设置
- (void)setBackGround:(UIImage *)image withDataSource:(NSArray *)dataArray anchorPoint:(CGPoint)point
{
    // 改变锚点并且修正坐标
    CGPoint oldOrigin = self.frame.origin;
    self.layer.anchorPoint = point;
    CGPoint newOrigin = self.frame.origin;
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    self.center = CGPointMake (self.center.x - transition.x, self.center.y - transition.y);
    
    // 添加背景图
    UIImageView *backImage = [[UIImageView alloc] initWithImage:image];
    backImage.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:backImage];
//    self.layer.shadowOpacity = 0.5;
//    self.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.layer.shadowOffset = CGSizeMake(2, 2);
//    self.layer.shadowRadius = 2;
    
    // 给列表填充色数据
    tableDataArray = dataArray;
    [menuTableView reloadData];
}

#pragma mark - 显示和隐藏,淡入淡出
- (void)showHoverMenu
{
    // 动画show出
    self.hidden = NO;
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DIdentity;
    }];
//    for (UIView *view in self.subviews)
//    {
//        view.alpha = 0;
//    }
//    [UIView animateWithDuration:0.3 animations:^{
//        for (UIView *view in self.subviews)
//        {
//            view.alpha = 1;
//        }
//    }];
}

- (void)dismissHoverMenu
{
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

#pragma mark - 列表代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identityCell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identityCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identityCell];
    }
    cell.textLabel.text = tableDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectBlock)
    {
        self.selectBlock(tableDataArray[indexPath.row]);
    }
}

@end

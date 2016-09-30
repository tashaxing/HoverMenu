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
    UITableView *tableView;
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
        tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
    }
    return self;
}

#pragma mark - 外部设置
- (void)setBackGround:(UIImage *)image withDataSource:(NSArray *)dataArray
{
    [self setBackGround:image];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 2;
    
    tableDataArray = dataArray;
}

- (void)showHoverMenu
{
    // 动画show出
    self.hidden = NO;
}

- (void)dismissHoverMenu
{
    self.hidden = YES;
}

#pragma mark - 列表代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)menuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identityCell = @"Cell";
    UITableViewCell *cell = [menuTableView dequeueReusableCellWithIdentifier:identityCell];
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

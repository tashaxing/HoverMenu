//
//  HoverMenuView.h
//  HoverMenu
//
//  Created by yxhe on 16/9/30.
//  Copyright © 2016年 tashaxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Block)(NSString *);

@interface HoverMenuView : UIView

@property(nonatomic, strong) Block selectBlock;

// 弹出
- (void)showHoverMenu;
// 隐藏
- (void)dismissHoverMenu;

// 设置背景
- (void)setBackGround:(UIImage *)image withDataSource:(NSArray *)dataArray anchorPoint:(CGPoint)point;

@end

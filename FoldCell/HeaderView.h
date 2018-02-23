//
//  HeaderView.h
//  FoldCell
//
//  Created by Watson on 2018/2/23.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UITableViewHeaderFooterView
@property (nonatomic) UILabel *textLb;

@property (nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) NSInteger section;
//添加一个手势 tap.点击后通过block回调, 告诉viewcontroller 当前是哪个头被点了
@property (nonatomic, copy) void(^tapBlock)(NSInteger section);
@end

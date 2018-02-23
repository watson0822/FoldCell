//
//  DataModel.h
//  FoldCell
//
//  Created by yiqiang on 2018/2/23.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import <Foundation/Foundation.h>
//对应的是每个分组的数据
@interface DataModel : NSObject
//分组头的名字
@property (nonatomic) NSString *title;
//此分组的展开状态
@property (nonatomic, getter=isFold) BOOL fold;//折叠
//分组的内容
@property (nonatomic) NSArray *dataList;
@end
